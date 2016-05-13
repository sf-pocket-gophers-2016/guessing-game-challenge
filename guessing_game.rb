class GuessingGame
  attr_accessor :secret_num, :congrats_message, :remaining_guesses
  def initialize(secret, remaining_guesses)
    @secret_num = secret
    @remaining_guesses = remaining_guesses
    @congrats_message = 'Yay, you won!'
    @already_guessed = []
    @has_won = false
    @has_lost = false
  end

  def congrats_message
    @congrats_message
  end

  def has_won?
    if @secret_num == @remaining_guesses
      true
    else
      false
    end
  end

  def has_lost?
    if @secret_num == @remaining_guesses
      true
    else
      false
    end
  end

  def guess(int)
    if int == @secret_num
      return @congrats_message + " The number was #{@secret_num}"
    end

    if @already_guessed.index(int) == nil
      @already_guessed << int
      @remaining_guesses -= 1
      if @remaining_guesses == 1
        return "Too high! WARNING: Only one guess left!"
      end
    elsif @already_guessed.index(int) != nil
      #@remaining_guesses
      if @remaining_guesses == 1
        return "Too high! WARNING: Only one guess left!"
      end
    end

    if int != @secret_num || @remaining_guesses == 0
      return "You lost! The number was #{@secret_num}"
    end

    if int <  @secret_num
      return "Too low!"
    elsif int >  @secret_num
      return "Too high!"
    elsif int == @secret_num
      return "Correct!"
    end
  end
end
