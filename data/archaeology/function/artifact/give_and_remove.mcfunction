# Give the item and remove entities

# Copy the item to give to the player
data modify storage item_display:temp GiveItem set from entity @s item

# Summon item entity
execute if data storage item_display:temp GiveItem run execute as @s at @p run summon minecraft:item ~ ~0.25 ~ {Item:{id:"minecraft:stone"},Tags:["dropped_artifact"]}
execute if data storage item_display:temp GiveItem run data modify entity @e[type=minecraft:item,tag=dropped_artifact,limit=1,sort=nearest] Item set from storage item_display:temp GiveItem

# Remove the interaction entity
execute as @e[type=minecraft:interaction,tag=clickable] if score @s display_id = #current display_id run kill @s

# Remove the item display entity
kill @s

# Print storage contents before clearing
# tellraw @p {"text":"[DEBUG] Clearing storage: ","color":"yellow","extra":[{"nbt":"GiveItem","storage":"item_display:temp"}]}

# Clear the storage
data remove storage item_display:temp GiveItem

tellraw @p {"text":"You retrieved an artifact!","color":"green"}