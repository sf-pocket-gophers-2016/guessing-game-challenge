class GuessingGame
  attr_accessor :secret_num, :congrats_message, :remaining_guesses
  def initialize(secret, remaining_guess)
    @secret_num = secret
    @remaining_guesses = remaining_guess
    @congrats_message = 'Yay, you won!'
    @already_guessed = []
    @has_won = false
    @has_lost = false
  end

  def congrats_message
    @congrats_message
  end

  def has_won?
    if @secret_num == @remaining_guess
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
    if @remaining_guesses == 1
      "Too high! WARNING: Only one guess left!"
    end

    if @already_guessed.index(int) == nil
        @already_guessed << int
        @remaining_guesses -= 1
    elsif @already_guessed.index(int) != nil
        if int <  @secret_num
          # @already_guessed << int
            "Too low!"
        elsif int >  @secret_num
          # @already_guessed << int
          "Too high!"
        elsif int == @secret_num
          "Correct!"
      end
      #@remaining_guesses
    end







  end
end
