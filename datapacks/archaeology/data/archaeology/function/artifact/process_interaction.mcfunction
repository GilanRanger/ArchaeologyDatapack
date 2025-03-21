# Process interaction function

# Get the ID of the interaction that was clicked
execute store result score #current display_id run scoreboard players get @e[type=minecraft:interaction,tag=clickable,nbt={interaction:{}},limit=1] display_id

# Find the matching item display
execute as @e[type=minecraft:item_display] if score @s display_id = #current display_id run function archaeology:artifact/give_and_remove