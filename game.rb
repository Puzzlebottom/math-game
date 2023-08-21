require './player'
require './question'

class Game
  def initialize
    @players = []
    @active_player_index = 0
  end

  def run
    create_players
    until winner_exists?
      active_player = @players[@active_player_index]
      run_turn(active_player)
      puts game_status
    end

    puts winner
  end

  private

  def create_players
    while @players.length < 2
      puts "Player #{@players.length + 1}, what should I call you?"
      print '> '
      name = gets.chomp
      @players << Player.new(name)
      puts "Thank you #{name}. Get ready to math.\n"
    end
  end

  def winner_exists?
    @players.select(&:lives?).length == 1
  end

  def winner
    winner = @players.select(&:lives?)[0]
    "#{winner.name} wins with a score of #{winner.score} and #{winner.lives} lives remaining!"
  end

  def pose_question(player, question)
    puts "#{player.name}: #{question}"
    print '> '
    gets.chomp.to_i
  end

  def run_turn(player)
    question = Question.new
    response = pose_question(player, question)
    if question.check_answer?(response)
      player.increment_score
      puts "#{player.name}: YES! You are correct."
    else
      player.decrement_lives
      puts "#{player.name}: Seriously? NO!"
    end
    @active_player_index = (@active_player_index + 1) % @players.length
  end

  def game_status
    puts "#{@players[0]} vs. #{@players[1]}"
  end
end
