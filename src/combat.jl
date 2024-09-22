# combat.jl
include("characters.jl")
include("skills.jl")
include("utils.jl")

function determine_next_turn!(characters::Vector{Character})
    action_time = minimum([character.current_stats.action_value for character in characters])
    turn = Character[]
    for character in characters
        character.current_stats.action_value -= action_time
        character.current_stats.action_gauge += action_time * character.current_stats.stats.spd
        if character.current_stats.action_gauge >= 10000
            push!(turn, character)
            character.current_stats.action_gauge = 0
        end
    end
    return turn
end

function turn(character::Character, characters::Vector{Character})
    println("$(character.name) takes turn!")
    skill = readline()
    character.skills[Symbol(skill)](character, characters)
end

function play(characters)
    # Sprightly Vonwacq
    for character in characters
        if :Sprightly_Vonwacq in character.equipment && character.current_stats.stats.spd >= 120
            character.current_stats.action_gauge += 0.40 * 10000
        end
    end

    # Robin's passive
    # todo: change to a function that takes in the character and the characters vector
    for character in characters
        if typeof(character) == Robin
            character.current_stats.action_gauge += 0.25 * 10000
        end
    end

    # Calculate initial action values
    for character in characters
        calc_action_value!(character)
    end

    turn_count = 0

    while turn_count < 10
        turn_count += 1
        turned_characters = determine_next_turn!(characters)
        for character in turned_characters
            turn(character, characters)
        end

        for character in characters
            calc_action_value!(character)
            println("$(character.name) action value: $(character.current_stats.action_value)")
        end
        println("==========")
    end
end
