# combat.jl
include("characters.jl")
include("skills.jl")
include("utils.jl")

function calc_action_value!(character::Character)
    if character.current_stats.action_gauge >= 10000
        character.current_stats.action_value = 0.0
    else
        character.current_stats.action_value = (10000 - character.current_stats.action_gauge) / character.current_stats.stats.spd
    end
    return character.current_stats.action_value
end

function determine_next_turn!(chs::Vector{Character})
    action_time, idx = findmin(ch -> ch.current_stats.action_value, chs)
    for ch in chs
        ch.current_stats.action_value -= action_time
        ch.current_stats.action_gauge += action_time * ch.current_stats.stats.spd
    end
    return chs[idx]
end

function turn(ch::Character, chs::Vector{Character})
    println("$(ch.name) takes turn!")
    process_status_effects(ch)
    process_ultimate(chs)
    skill = readline()
    ch.skills[Symbol(skill)](ch, chs)
    ch.current_stats.action_gauge = 0
end

function sort_character!(chs::Vector{Character})
    sort!(chs, by=ch -> ch.current_stats.action_value)
end

function process_status_effects(ch::Character)
    expired_effects = []
    for effect in ch.status_effects
        effect.duration -= 1
        if effect.duration <= 0
            # Remove the effect
            effect.remove_effect(ch.current_stats.stats)
            push!(expired_effects, effect)
        end
    end
    # Remove expired effects from the character's status effects list
    for effect in expired_effects
        deleteat!(ch.status_effects, findfirst(isequal(effect), ch.status_effects))
    end
end

function display_stats(ch::Character)
    print("[$(ch.name)] ")
    print("energy: $(ch.current_stats.energy)/$(ch.base_stats.max_energy), ")
    print("action value: $(ch.current_stats.action_value), ")
    println("action gauge: $(ch.current_stats.action_gauge)")
end

function display_stats_all(chs::Vector{Character})
    println("====================================")
    display_stats.(chs)
    println("====================================")
end

function process_ultimate(chs::Vector{Character})
    can_use_ulti = filter(ch -> ch.current_stats.energy >= ch.base_stats.max_energy, chs)
    println("Characters that can use ulti: $(map(ch -> ch.name, can_use_ulti))")
    use_ulti = readline()
    ch = find_character_by_name(use_ulti, can_use_ulti)
    if isnothing(ch)
        println("Skipping ultimate")
    else
        ch.skills[:ultimate](ch, chs)
        if :Eagle_of_Twilight_Line_4 in ch.equipment
            ch.current_stats.action_gauge += 0.25 * 10000
        end
        ch.current_stats.energy = 0
        display_stats_all(chs)
    end
end

function play(chs)
    # Sprightly Vonwacq
    for ch in chs
        if :Sprightly_Vonwacq in ch.equipment && ch.current_stats.stats.spd >= 120
            ch.current_stats.action_gauge += 0.40 * 10000
        end
    end

    # Robin's passive
    # todo: change to a function that takes in the ch and the chs vector
    for ch in chs
        if typeof(ch) == Robin
            ch.current_stats.action_gauge += 0.25 * 10000
        end
    end

    # Calculate initial action values
    calc_action_value!.(chs)
    sort_character!(chs)

    turn_count = 0

    while turn_count < 10
        turn_count += 1

        chs_in_turn = determine_next_turn!(chs)
        turn(chs_in_turn, chs)
        calc_action_value!.(chs)
        sort_character!(chs)
        display_stats_all(chs)

        process_ultimate(chs)
        calc_action_value!.(chs)
        sort_character!(chs)
        display_stats_all(chs)
    end
end
