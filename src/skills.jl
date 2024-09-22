# skills.jl
include("characters.jl")

# Acheron's skills
function acheron_q_skill(character::Character, characters::Vector{Character})
    println("Acheron used Q skill")
end

# Sparkle's skills
function sparkle_q_skill(character::Character, characters::Vector{Character})
    println("Sparkle used Q skill")
end

function sparkle_e_skill(character::Character, characters::Vector{Character})
    target_name = readline()
    target = find_character_by_name(target_name, characters)

    if target !== nothing
        target.current_stats.action_gauge += 5000
        println("Sparkle used E skill on $(target.name)")
    else
        println("No character with the name $target_name found.")
    end
end

# Robin's skills
function robin_q_skill(character::Character, characters::Vector{Character})
    println("Robin used Q skill")
end

function robin_e_skill(character::Character, characters::Vector{Character})
    println("Robin used E skill")
end

# Black Swan's skills
function black_swan_q_skill(character::Character, characters::Vector{Character})
    println("Black Swan used Q skill")
end

function black_swan_e_skill(character::Character, characters::Vector{Character})
    println("Black Swan used E skill")
end
