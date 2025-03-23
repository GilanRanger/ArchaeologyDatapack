# handle_interaction.mcfunction
# This function should be run from a tick function or command block

# Check for player interactions
execute as @e[type=minecraft:interaction] if data entity @s interaction run function archaeology:artifact/process_interaction
execute as @e[type=minecraft:interaction] if data entity @s interaction run data remove entity @s interaction
