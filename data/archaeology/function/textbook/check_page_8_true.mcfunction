# Check function for page 8 (True clicked)
            # Reset tag counter
            scoreboard players set @s tagCheck 0

            # Check for each possible tag
            execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:22}}}]} run scoreboard players add @s tagCheck 1
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:27}}}]} run scoreboard players add @s tagCheck 1
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:28}}}]} run scoreboard players add @s tagCheck 1
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:29}}}]} run scoreboard players add @s tagCheck 1
execute if block -193 6 16 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:30}}}]} run scoreboard players add @s tagCheck 1

            # Execute appropriate function based on whether enough tags are present
            execute if score @s tagCheck matches 1.. run function archaeology:textbook/answer_correct
            execute if score @s tagCheck matches 1.. if score @s textbook_q8 matches 0 run scoreboard players add @s textbook_correct 1
            execute if score @s tagCheck matches 1.. if score @s textbook_q8 matches 0 run scoreboard players set @s textbook_q8 1
            execute unless score @s tagCheck matches 1.. run function archaeology:textbook/answer_incorrect