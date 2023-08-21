## CLASSES

### GAME
- It prompts each player for a name (accepting no duplicates), and instantiates Player class for each
- It checks that both players have lives remaining
- If a player is out of lives, it declares a winner, else:
- It instantiates a new Question and poses it to a Player

  #### State
  - players (Player[])
  - active_player_index (number)

  #### Methods
  - run
  - create_players
  - winner_exists?
  - winner
  - pose_question(player, question)
  - run_turn(player)
  - game_status


### Player
- Instantiated with an argument NAME, lives 3, score 0

  #### State
  - name (string)
  - lives (number)
  - score (number)

  #### Methods
  - lives?
  - increment_score
  - decrement_lives
  _ to_s

### Question
- Instantiated without arguments
- Generates 2 random numbers between 1 and 20 and formats them into a problem string
- calculates correct answer

  #### State
  - first number
  - second number

  #### Methods
  - get_random_number
  - to_s
  - check_answer?(response)
