# main.jl
include("character_instances.jl")
include("combat.jl")

# Update stats
update_home_stats!(acheron, spd=108.8)
update_home_stats!(sparkle, spd=161.0)
update_home_stats!(robin, spd=125.0)
update_home_stats!(black_swan, spd=161.532)

push!(robin.equipment, :Sprightly_Vonwacq)

# Start the game
play([acheron, sparkle, robin, black_swan])
