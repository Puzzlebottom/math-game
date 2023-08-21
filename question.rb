class Question
  def initialize
    @first_number = random_number
    @second_number = random_number
  end

  def to_s
    "What does #{@first_number} + #{@second_number} equal?"
  end

  def check_answer?(answer)
    @first_number + @second_number == answer
  end

  private

  def random_number
    rand(1..20)
  end
end
