# types.jl
struct ImmutableStats
    hp::Float64
    atk::Float64
    def::Float64
    spd::Float64
    crit_rate::Float64
    crit_dmg::Float64
end

mutable struct MutableStats
    hp::Float64
    atk::Float64
    def::Float64
    spd::Float64
    crit_rate::Float64
    crit_dmg::Float64
end

struct BaseStats
    stats::ImmutableStats
    max_energy::Float64
end

struct HomeStats
    stats::MutableStats
end

mutable struct CurrentStats
    stats::MutableStats
    action_gauge::Float64
    action_value::Float64
    energy::Float64
end

mutable struct StatusEffect
    name::Symbol
    duration::Int
    apply_effect::Function
    remove_effect::Function
end

abstract type Character end
