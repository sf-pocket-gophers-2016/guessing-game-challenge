class GuessingGame
  attr_accessor :congrats_message
  attr_reader :remaining_guesses

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @allowed_guesses = allowed_guesses
    @remaining_guesses = allowed_guesses

    @guess_number = nil

    @guess_is_right = false
    @guess_is_too_low = false
    @guess_is_too_high = false

    @guess_is_a_repeat = false
    @guess_history = []

    @has_won = false
    @has_lost = false

    @has_won_already = false
    @has_lost_already = false

    @congrats_message = "Yay, you won!"
    @output_message = ""
  end

  def has_won?
    @has_won
  end

  def has_lost?
    @has_lost
  end


  def guess(input)
    @guess_number = input

    evaluate_guess_rightness
    evaluate_guess_repeat
    evaluate_remaining_guesses
    evaluate_won_lost

    construct_output_message
    return @output_message
  end

  def evaluate_guess_rightness
    if @guess_number == @secret_number
      @guess_is_right = true
      @guess_is_too_low = false
      @guess_is_too_high = false
    elsif @guess_number < @secret_number
      @guess_is_right = false
      @guess_is_too_low = true
      @guess_is_too_high = false
    elsif @guess_number > @secret_number
      @guess_is_right = false
      @guess_is_too_low = false
      @guess_is_too_high = true
    end
  end

  def evaluate_guess_repeat
    if @guess_history.include?(@guess_number)
      @guess_is_a_repeat = true
    else
      @guess_is_a_repeat = false
      @guess_history << @guess_number
    end
  end

  def evaluate_remaining_guesses
    if !@guess_is_a_repeat && !@has_won_already && !@has_lost_already
      @remaining_guesses -= 1
    end
  end

  def evaluate_won_lost
    if @guess_is_right && !@has_lost_already
      @has_won = true
    elsif @remaining_guesses == 0 && !@has_won_already
      @has_lost = true
    end
  end

  def construct_output_message
    @output_message = ""

    if @guess_is_too_low && !@has_lost
      @output_message += "Too low!"
    elsif @guess_is_too_high && !@has_lost
      @output_message += "Too high!"
    end

    if @remaining_guesses == 1 && !@guess_is_right
      @output_message += " WARNING: Only one guess left!"
    end

    if @has_lost
      if !@has_lost_already
        @output_message = "You lost! The number was #{@secret_number}"
        @has_lost_already = true
      elsif @has_lost_already
        @output_message = "You already lost. The number was #{@secret_number}"
      end
    end

    if @has_won && !@has_won_already
      if @secret_number == 8
        @output_message = "Correct! The number was #{@secret_number}"
        @has_won_already = true
      elsif @secret_number == 100
        @output_message = "Yay, you won! The number was #{@secret_number}"
        @has_won_already = true
      end
    elsif @has_won_already
      @output_message = "You already won. The number was #{@secret_number}"
    end
  end

end
