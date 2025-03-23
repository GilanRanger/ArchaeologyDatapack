# Give the book to the player
give @p written_book[written_book_content={title:"Archaeology Textbook",author:"Daskalost My Brush",pages:['["The sky is blue.",{"text":"\\n\\n[True]","color":"green","clickEvent":{"action":"run_command","value":"/function archaeology:textbook/check_page_1_true"}},{"text":"\\n\\n[False]","color":"red","clickEvent":{"action":"run_command","value":"/function archaeology:textbook/check_page_1_false"}}]']}] 1

# Initialize scoreboard for artifact checking
scoreboard objectives add tagCheck dummy
scoreboard objectives add textbook_correct dummy "Correct Answers"
scoreboard objectives setdisplay sidebar textbook_correct
scoreboard players set @p textbook_correct 0

# Initialize scoreboard objectives for each question
scoreboard objectives add textbook_q1 dummy
scoreboard players set @p textbook_q1 0