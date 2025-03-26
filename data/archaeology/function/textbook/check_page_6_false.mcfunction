# Check function for page 6 (False clicked)
            # Reset tag counter
            scoreboard players set @s tagCheck 0

            # Check for each possible tag
            execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:20}}}]} run scoreboard players add @s tagCheck 1
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:21}}}]} run scoreboard players add @s tagCheck 1
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:22}}}]} run scoreboard players add @s tagCheck 1

            # Execute appropriate function based on whether enough tags are present
            execute if score @s tagCheck matches 2.. run function archaeology:textbook/answer_incorrect
            
            execute unless score @s tagCheck matches 2.. run function archaeology:textbook/answer_incorrect