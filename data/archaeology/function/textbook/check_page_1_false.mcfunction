# Check function for page 1 (False clicked)
            # Reset tag counter
            scoreboard players set @s tagCheck 0

            # Check for each possible tag
            execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:1}}}]} run scoreboard players add @s tagCheck 1
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:2}}}]} run scoreboard players add @s tagCheck 1
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:3}}}]} run scoreboard players add @s tagCheck 1

            # Mark incorrect for other tags
            execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:4}}}]} run scoreboard players remove @s tagCheck 5
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:5}}}]} run scoreboard players remove @s tagCheck 5
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:6}}}]} run scoreboard players remove @s tagCheck 5

            # Execute appropriate function based on whether enough tags are present
            execute if score @s tagCheck matches 1.. run function archaeology:textbook/answer_incorrect
            
            execute unless score @s tagCheck matches 1.. run function archaeology:textbook/answer_incorrect