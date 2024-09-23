# skills.jl
include("characters.jl")

# Acheron's skills
function acheron_q_skill(ch::Character, chs::Vector{Character})
    println("Acheron used Q skill")
end

function acheron_e_skill(ch::Character, chs::Vector{Character})
    println("Acheron used E skill")
end

# Sparkle's skills
function sparkle_q_skill(ch::Character, chs::Vector{Character})
    println("Sparkle used Q skill")
    ch.current_stats.energy += 20 * ch.home_stats.energy_regenerate
end

function sparkle_e_skill(ch::Character, chs::Vector{Character})
    target_name = readline()
    ch.current_stats.energy += 30 * ch.home_stats.energy_regenerate

    target = find_character_by_name(target_name, chs)
    if target !== nothing
        target.current_stats.action_gauge += 5000
        println("Sparkle used E skill on $(target.name)")
    else
        println("No ch with the name $target_name found.")
    end
end

function sparkle_ultimate(ch::Character, chs::Vector{Character})
    println("Sparkle used Ultimate skill")
    ch.current_stats.energy += 5 * ch.home_stats.energy_regenerate
end

# Robin's skills
function robin_q_skill(ch::Character, chs::Vector{Character})
    println("Robin used Q skill")
    ch.current_stats.energy += 20 * ch.home_stats.energy_regenerate
end

function robin_e_skill(ch::Character, chs::Vector{Character})
    println("Robin used E skill")
    ch.current_stats.energy += 30 * ch.home_stats.energy_regenerate
    ch.current_stats.energy += 5 * ch.home_stats.energy_regenerate
end

concerto = StatusEffect(
    :Concerto,
    1,
    c::Character -> c.current_stats.stats.spd = 90,
    c::Character -> c.current_stats.action_gauge = c.home_stats.stats.spd
)

function robin_ultimate(ch::Character, chs::Vector{Character})
    println("Robin used Ultimate skill")
    ch.current_stats.energy += 5 * ch.home_stats.energy_regenerate
    push!(ch.status_effects, concerto)
    map(c::Character -> c.current_stats.action_gauge = 10000, setdiff(chs, [ch]))
end

# Black Swan's skills
function black_swan_q_skill(ch::Character, chs::Vector{Character})
    println("Black Swan used Q skill")
end

function black_swan_e_skill(ch::Character, chs::Vector{Character})
    println("Black Swan used E skill")
end
