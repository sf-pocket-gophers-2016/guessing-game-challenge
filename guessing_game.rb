require 'pry-byebug'

class GuessingGame

  attr_accessor :congrats_message, :remaining_guesses, :won

  def initialize(secret_number, num_guesses)
    @congrats_message = "Yay, you won!"
    @secret_number = secret_number
    @remaining_guesses = num_guesses
    @guessed_numbers = []
    @won = false
    @lost = false
  end

  def has_won?
    @won
  end

  def has_lost?
    @lost
  end

  def guess(num)
    return "You already won. The number was #{@secret_number}" if has_won?
    return "You already lost. The number was #{@secret_number}" if has_lost?

    if num < @secret_number
      deduct_guesses(num)
      warning("Too low!")
    elsif num > @secret_number
      deduct_guesses(num)
      warning("Too high!")
    else num == @secret_number
      deduct_guesses(num)
      @won = true
      return win
    end
  end

  def deduct_guesses(num)
    # p @remaining_guesses
    if @guessed_numbers.include?(num)
      # do nothing
      @remaining_guesses
    else
      @remaining_guesses = @remaining_guesses -1
      @guessed_numbers << num
    end
  end

  def warning(mesg)
    if @remaining_guesses == 1
      p mesg + " WARNING: Only one guess left!"
    elsif
      @remaining_guesses == 0
      return lose
    else
      return mesg
    end
  end

  def zero_guesses
    if @remaining_guesses == 0
      return lose
    else
      @remaining_guesses
    end
  end

  def win
   @congrats_message + " The number was #{@secret_number}"
  end

  def lose
    @lost = true
    return "You lost! The number was #{@secret_number}"
  end


end
