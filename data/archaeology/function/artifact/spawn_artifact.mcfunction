# create_display.mcfunction
# Usage: /function namespace:spawn_artifact

# Store the player's selected item to a storage
data modify storage item_display:temp Item set from entity @s SelectedItem

# Create the item display entity at the specified position
execute at @s run summon minecraft:item_display ~ ~ ~ {Tags:["new_display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}

# Create the interaction entity at the same position
execute at @s run summon minecraft:interaction ~ ~ ~ {Tags:["new_interaction"],width:0.5f,height:0.5f}

# Set the item to display
data modify entity @e[type=minecraft:item_display,tag=new_display,limit=1] item set from storage item_display:temp Item

# Clear the storage
data remove storage item_display:temp Item

# Set the rotation values (convert degrees to radians)
execute as @e[type=minecraft:item_display,tag=new_display] run data modify entity @s transformation.left_rotation set from entity @p SelectedItem.components."minecraft:custom_data".rotation

# Set the scale
execute as @e[type=minecraft:item_display,tag=new_display] run data modify entity @s transformation.scale set from entity @p SelectedItem.components."minecraft:custom_data".scale

# Link the interaction with the display (using a scoreboard)
scoreboard objectives add display_id dummy
execute store result score @e[type=minecraft:item_display,tag=new_display,limit=1] display_id run scoreboard players add #global display_id 1
execute store result score @e[type=minecraft:interaction,tag=new_interaction,limit=1] display_id run scoreboard players get #global display_id

# Remove the "new" tags
tag @e[type=minecraft:item_display,tag=new_display] remove new_display
tag @e[type=minecraft:interaction,tag=new_interaction] remove new_interaction

# Add a clickable tag
tag @e[type=minecraft:interaction] add clickable

# Remove item
item replace entity @s weapon.mainhand with minecraft:air

tellraw @s {"text":"Artifact spawned!","color":"green"}