# Check function for page 2 (True clicked)
# Reset tag counter
scoreboard players set @s tagCheck 0

# Check for each possible tag
execute if block 15 -60 11 minecraft:hopper{Items:[{components:{"minecraft:custom_data":{tag:4}}}]} run scoreboard players add @s tagCheck 1

# Execute appropriate function based on whether enough tags are present
execute if score @s tagCheck matches 1.. run function archaeology:textbook/answer_correct
execute unless score @s tagCheck matches 1.. run function archaeology:textbook/answer_incorrect