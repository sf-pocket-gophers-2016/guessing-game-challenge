class GuessingGame
  attr_accessor :congrats_message
  attr_reader :remaining_guesses

  def initialize(secret_number, guesses_allowed)
    @secret_number = secret_number
    @remaining_guesses = guesses_allowed
    @congrats_message = "Yay, you won!"
    @status = nil
  end

  def has_won?
    @status == true
  end

  def has_lost?
    @status == false
  end

  def guess(guess)
    @last_guess = nil
    # if last_guess != guess
      if guess < @secret_number
        guess_is_low
      end
    end
    if last_guess == guess
      if guess < @secret_number
        return "Too low!"
      end
    end
   last_guess = guess
  end

  def subtract_guesses
    @remaining_guesses -= 1
  end

  # def repeated_guess?(guess)
  # end

  def guess_is_low
    subtract_guesses
    return "Too low!"
  end













end


