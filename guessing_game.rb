class GuessingGame
  attr_accessor :secret_number, :allowed_guesses, :remaining_guesses, :guess_history, :congrats_message, :guess_number

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @allowed_guesses = allowed_guesses
    @remaining_guesses = allowed_guesses
    @guess_history = []
    @congrats_message = "Yay, you won!"
    @has_won = false
    @has_lost = false
    @guess_number = nil
  end

  def has_won?
    @has_won
  end

  def has_lost?
    @has_lost
  end

  def guess(input)
    @guess_number = input
    evaluate_guess_repeat
    evaluate_guess_value
  end

  def evaluate_guess_repeat
    if !@guess_history.include?(@guess_number)
      @guess_history << @guess_number
    else
      @remaining_guesses -= 1
    end
  end

  def evaluate_guess_value
    if @guess_number < @secret_number
      feedback_too_low
    elsif @guess_number > @secret_number
      feedback_too_high
    end
  end

  def feedback_too_low
    "Too low!"
  end

  def feedback_too_high
    "Too high!"
  end



end
