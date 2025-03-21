# create_display.mcfunction
# Usage: /function namespace:create_display <x> <y> <z> <rot_x> <rot_y> <rot_z> <scale>
# Example: /function namespace:create_display ~ ~1 ~ 0 0 0 1
# Example: /function namespace:create_display 100 64 -200 90 45 0 2

tellraw @p {"text":"test","color":"green"}

# Store the player's selected item to a storage
data modify storage item_display:temp Item set from entity @s SelectedItem

# Create the item display entity at the specified position
$execute at @s run summon minecraft:item_display $(x) $(y) $(z) {Tags:["new_display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}

# Create the interaction entity at the same position
$execute at @s run summon minecraft:interaction $(x) $(y) $(z) {Tags:["new_interaction"],width:0.5f,height:0.5f}

# Set the item to display
data modify entity @e[type=minecraft:item_display,tag=new_display,limit=1] item set from storage item_display:temp Item

# Clear the storage
data remove storage item_display:temp Item

# Set the rotation values (convert degrees to radians)
execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.left_rotation[0] float 0.0174533 run scoreboard players set #temp rot_x 0
execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.left_rotation[1] float 0.0174533 run scoreboard players set #temp rot_y 0
execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.left_rotation[2] float 0.0174533 run scoreboard players set #temp rot_z 0
$execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.left_rotation[0] float 0.0174533 run scoreboard players set #temp rot_x $(rot_x)
$execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.left_rotation[1] float 0.0174533 run scoreboard players set #temp rot_y $(rot_y)
$execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.left_rotation[2] float 0.0174533 run scoreboard players set #temp rot_z $(rot_z)

# Set the scale
$execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.scale[0] float 1 run scoreboard players set #temp scale $(scale)
$execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.scale[1] float 1 run scoreboard players set #temp scale $(scale)
$execute as @e[type=minecraft:item_display,tag=new_display,limit=1] store result entity @s transformation.scale[2] float 1 run scoreboard players set #temp scale $(scale)

# Link the interaction with the display (using a scoreboard)
scoreboard objectives add display_id dummy
execute store result score @e[type=minecraft:item_display,tag=new_display,limit=1] display_id run scoreboard players add #global display_id 1
execute store result score @e[type=minecraft:interaction,tag=new_interaction,limit=1] display_id run scoreboard players get #global display_id

# Remove the "new" tags
tag @e[type=minecraft:item_display,tag=new_display] remove new_display
tag @e[type=minecraft:interaction,tag=new_interaction] remove new_interaction

# Add a clickable tag
tag @e[type=minecraft:interaction] add clickable

tellraw @s {"text":"Item display created!","color":"green"}