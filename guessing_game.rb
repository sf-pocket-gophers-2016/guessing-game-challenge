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

    if @guess_array.include?(number)
      if number < @secret_number
        return "Too low!"
      else number > @secret_number
        return "Too high!"
        # p "You've repeated a guess... Try again."
      end

    elsif !@guess_array.include?(number)
      if number < @secret_number
          @num_of_guesses = @num_of_guesses -1
        @guess_array << number
        return "Too low!"
      elsif number > @secret_number
          @num_of_guesses -= 1
          @guess_array << number
          return "Too high!"
        else
          @congrats_message
      end
    end
  end
end
