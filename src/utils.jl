# utils.jl
include("types.jl")

function update_home_stats!(character::Character, new_stats::ImmutableStats)
    character.home_stats.stats = new_stats
    character.current_stats.stats = new_stats
end

function update_home_stats!(character::Character; kwargs...)
    for (key, value) in kwargs
        if hasfield(typeof(character.home_stats.stats), key)
            setfield!(character.home_stats.stats, key, value)
            setfield!(character.current_stats.stats, key, value)
        else
            error("Invalid field name: ", key)
        end
    end
end

function calc_action_value!(character::Character)
    if character.current_stats.action_gauge >= 10000
        character.current_stats.action_value = 0.0
    else
        character.current_stats.action_value = (10000 - character.current_stats.action_gauge) / character.current_stats.stats.spd
    end
    return character.current_stats.action_value
end

function find_character_by_name(name::String, characters::Vector{Character})
    for character in characters
        if character.name == name
            return character
        end
    end
    return nothing
end
