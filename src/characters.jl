# characters.jl
include("types.jl")

macro character_struct(name)
    quote
        struct $name <: Character
            name::String
            base_stats::BaseStats
            home_stats::HomeStats
            current_stats::CurrentStats
            status_effects::Vector{StatusEffect}
            equipment::Vector{Symbol}
            skills::Dict{Symbol,Function}
        end
    end
end
