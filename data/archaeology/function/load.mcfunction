#This function will run on world loading or data pack loading
gamerule sendCommandFeedback false

# scoreboard objectives
scoreboard objectives add display_id dummy
scoreboard objectives add rot_x dummy
scoreboard objectives add rot_y dummy
scoreboard objectives add rot_z dummy
scoreboard objectives add scale dummy
scoreboard players set #global display_id 0