class GuessingGame

  attr_accessor :congrats_message, :remaining_guesses
  attr_accessor :has_won, :has_lost

  def initialize(secret_number, num_guesses)
    @congrats_message = "Yay, you won!"
    @secret_number = secret_number
    @remaining_guesses = num_guesses
    @guessed_numbers = []
    # @remaining_guesses = 0
  end

  def has_won?
    @won = false
  end

  def has_lost?
    @lost = false
  end

  def guess(num)
    if num < @secret_number
      deduct_guesses(num)
      return "Too low!"
    end
  end

  def deduct_guesses(num)
    # p @remaining_guesses
    if @guessed_numbers.include?(num)
      # do nothing
      @remaining_guesses
    else
      @remaining_guesses = @remaining_guesses - 1
      @guessed_numbers << num
    end
  end


end
