class GuessingGame
  attr_accessor :congrats_message
  def initialize(secret_number, number_of_guesses)
    @secret_number = secret_number
    @number_of_guesses = number_of_guesses
    @congrats_message = "Yay, you won!"
    @guesses = []
    @status = :ongoing
  end

  def remaining_guesses
    @number_of_guesses
  end

  def guess(num)
    if @status == :won
      return "You already won. The number was #{@secret_number}"
    elsif @status == :lost
      return "You already lost. The number was #{@secret_number}"
    end

    unless @guesses.include?(num)
      @number_of_guesses -= 1
      @guesses << num
    end

    # Deciding if the number is high,low or correct, first part of the response
    if num < @secret_number
      response = 'Too low!'
    elsif num > @secret_number
      response = 'Too high!'
    else
      @status = :won
      response = "#{@congrats_message} The number was #{@secret_number}"
    end

    if @number_of_guesses == 1 && @status == :ongoing
      response += ' WARNING: Only one guess left!'
    elsif @number_of_guesses == 0 && @status == :ongoing
      @status = :lost
      "You lost! The number was #{@secret_number}"
    else
      response
    end

  end

  def has_won?
    return true if @status == :won
    false
  end

  def has_lost?
    return true if @status == :lost
    false
  end
end
