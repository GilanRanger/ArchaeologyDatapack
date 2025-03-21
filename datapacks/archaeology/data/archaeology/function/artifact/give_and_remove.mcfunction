# Give the item and remove entities

# Copy the item to give to the player
data modify storage item_display:temp GiveItem set from entity @s item

# Summon item entity
execute as @s at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stone"},Tags:["dropped_artifact"]}
data modify entity @e[type=minecraft:item,tag=dropped_artifact,limit=1,sort=nearest] Item set from storage item_display:temp GiveItem

# Remove the interaction entity
execute as @e[type=minecraft:interaction,tag=clickable] if score @s display_id = #current display_id run kill @s

# Remove the item display entity
kill @s

# Clear the storage
data remove storage item_display:temp GiveItem

tellraw @p {"text":"You retrieved an artifact!","color":"green"}