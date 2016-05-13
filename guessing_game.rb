class GuessingGame
  attr_reader :num_of_guesses
  attr_accessor :congrats_message, :has_lost, :has_won

  def initialize(secret_number, num_of_guesses)
    @secret_number = secret_number
    @num_of_guesses = num_of_guesses
    @congrats_message = "Yay, you won!"
    @has_lost = false
    @has_won = false
    @guess_array = []
  end

  def remaining_guesses
    return @num_of_guesses
  end

  def has_won?
    @has_won
  end

  def has_lost?
    @has_lost
  end

  def guess(number)
    if @has_won == true
      "You already won. The number was #{@secret_number}"
    elsif @has_lost == true
      "You already lost. The number was #{@secret_number}"

    elsif number == @secret_number
      @has_won = true
      @guess_array << number
      @num_of_guesses -= 1
      return "#{@congrats_message}" + " The number was #{number}"

    elsif @guess_array.include?(number)
      if @num_of_guesses == 1 && number < @secret_number
        return "Too low! WARNING: Only one guess left!"
      elsif @num_of_guesses == 1 && number > @secret_number
        return "Too high! WARNING: Only one guess left!"
      elsif number < @secret_number
        return "Too low!"
      else number > @secret_number
        return "Too high!"
      end

    elsif !@guess_array.include?(number)
      if @num_of_guesses == 1
        @num_of_guesses -=1
        @guess_array << number
        @has_lost = true
        return "You lost! The number was #{@secret_number}"
      elsif @num_of_guesses == 2 && number < @secret_number
        @num_of_guesses -=1
        @guess_array << number
        return "Too low! WARNING: Only one guess left!"
      elsif @num_of_guesses == 2 && number > @secret_number
        @num_of_guesses -=1
        @guess_array << number
        return "Too high! WARNING: Only one guess left!"
      elsif number < @secret_number
          @num_of_guesses -=1
        @guess_array << number
        return "Too low!"
      elsif number > @secret_number
          @num_of_guesses -= 1
          @guess_array << number
          return "Too high!"
      end

    end
  end
end
