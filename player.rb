class Player
  attr_reader :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def lives?
    @lives.positive?
  end

  def increment_score
    @score += 1
  end

  def decrement_lives
    @lives -= 1
  end

  def to_s
    "#{@name}: #{@lives}/3 lives, #{@score} points"
  end
end
