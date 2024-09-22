# character_definitions.jl
include("types.jl")
include("characters.jl")

# Define character structures using macro
@character_struct(Acheron)
@character_struct(Sparkle)
@character_struct(Robin)
@character_struct(Black_Swan)
