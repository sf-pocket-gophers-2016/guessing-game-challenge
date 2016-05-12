

class GuessingGame

  attr_accessor :congrats_message, :remaining_guesses


  def initialize(secret_number,num_guesses)
    @secret_number = secret_number
    @num_guesses = num_guesses
    @congrats_message = "Yay, you won!"
    @remaining_guesses = @num_guesses
    @has_won = false
    @has_lost = false
    @previous_guesses = []
  end

  def has_won?
    @has_won
  end

  def has_lost?
    @has_lost
  end

  def guess(number)
    output_string = ""
    if @has_won
      output_string << "You already won. The number was #{@secret_number}"
    elsif @has_lost
      output_string << "You already lost. The number was #{@secret_number}"
    elsif number == @secret_number
      @remaining_guesses -= 1
      @has_won = true
      output_string << "#{@congrats_message} The number was #{@secret_number}"
    else
      @remaining_guesses -= 1
      if @previous_guesses.include?(number)
        @remaining_guesses += 1
      end
      if @remaining_guesses == 0
        @has_lost = true
        output_string << "You lost! The number was #{@secret_number}"
      elsif number < @secret_number
        output_string << "Too low!"
        if @remaining_guesses == 1
          output_string << " WARNING: Only one guess left!"
        end
        @previous_guesses << number
      else
        output_string << "Too high!"
        if @remaining_guesses == 1
          output_string << " WARNING: Only one guess left!"
        end
        @previous_guesses << number
      end
    end
    output_string
  end





end

