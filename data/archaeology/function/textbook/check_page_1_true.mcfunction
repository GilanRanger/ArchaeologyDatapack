# Check function for page 1 (True clicked)
            # Reset tag counter
            scoreboard players set @s tagCheck 0

            # Check for each possible tag
            execute if block 15 -60 11 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:1}}}]} run scoreboard players add @s tagCheck 1
execute if block 15 -60 11 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:2}}}]} run scoreboard players add @s tagCheck 1
execute if block 15 -60 11 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:3}}}]} run scoreboard players add @s tagCheck 1

            # Execute appropriate function based on whether enough tags are present
            execute if score @s tagCheck matches 1.. run function archaeology:textbook/answer_correct
            execute if score @s tagCheck matches 1.. if score @s textbook_q1 matches 0 run scoreboard players add @s textbook_correct 1
            execute if score @s tagCheck matches 1.. if score @s textbook_q1 matches 0 run scoreboard players set @s textbook_q1 1
            execute unless score @s tagCheck matches 1.. run function archaeology:textbook/answer_incorrect