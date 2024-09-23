# character_instances.jl
include("character_definitions.jl")
include("skills.jl")

acheron = Acheron(
    "Acheron",
    BaseStats(ImmutableStats(1125, 698.54, 436.59, 101, 0.05, 0.5), 0),
    HomeStats(MutableStats(1125, 698.54, 436.59, 101, 0.05, 0.5), 0),
    CurrentStats(MutableStats(1125, 698.54, 436.59, 101, 0.05, 0.5), 0, 0, 0, 0),
    StatusEffect[],
    Symbol[],
    Dict(:q => acheron_q_skill)
)

sparkle = Sparkle(
    "Sparkle",
    BaseStats(ImmutableStats(1397, 523.91, 485.1, 101, 0.05, 0.5), 110),
    HomeStats(MutableStats(1397, 523.91, 485.1, 101, 0.05, 0.5), 1.194),
    CurrentStats(MutableStats(1397, 523.91, 485.1, 101, 0.05, 0.5), 1.194, 0, 0, 110 / 2),
    StatusEffect[],
    Symbol[],
    Dict(:q => sparkle_q_skill, :e => sparkle_e_skill)
)

robin = Robin(
    "Robin",
    BaseStats(ImmutableStats(1281, 640.33, 485.1, 102, 0.05, 0.5), 160),
    HomeStats(MutableStats(1281, 640.33, 485.1, 102, 0.05, 0.5), 1.194),
    CurrentStats(MutableStats(1281, 640.33, 485.1, 102, 0.05, 0.5), 1.194, 0, 0, 160 / 2),
    StatusEffect[],
    Symbol[],
    Dict(:q => robin_q_skill, :e => robin_e_skill, :ultimate => robin_ultimate)
)

black_swan = Black_Swan(
    "Black Swan",
    BaseStats(ImmutableStats(1125, 698.54, 436.59, 102, 0.05, 0.5), 120),
    HomeStats(MutableStats(1125, 698.54, 436.59, 102, 0.05, 0.5), 1.0),
    CurrentStats(MutableStats(1125, 698.54, 436.59, 102, 0.05, 0.5), 1.0, 0, 0, 0),
    StatusEffect[],
    Symbol[],
    Dict(:q => black_swan_q_skill, :e => black_swan_e_skill)
)
