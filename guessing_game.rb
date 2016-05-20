class GuessingGame
  attr_reader :secret_num, :guess
  attr_accessor :congrats_message

  def initialize(secret_num, num_of_guesses)
    @secret_num = secret_num
    @num_of_guesses = num_of_guesses
    @congrats_message = "Yay, you won!"
    @has_won = false
    @has_lost = false
    @list_of_guesses = []
  end

  def remaining_guesses
    @num_of_guesses
  end

  def has_won?
    @has_won
  end

  def has_lost?
    @has_lost
  end

  def guess(num)

    if @has_won == true
      return "You already won. The number was #{secret_num}"
    elsif @has_lost == true
      return "You already lost. The number was #{secret_num}"
    elsif num == @secret_num
      @has_won = true
      @list_of_guesses << num
      return @congrats_message + " The number was #{secret_num}"
    elsif @list_of_guesses.include?(num)
      if num < @secret_num
        if @num_of_guesses == 1
          return "Too low! WARNING: Only one guess left!"
        end
        return "Too low!"
      elsif num > @secret_num
        if @num_of_guesses == 1
          return "Too high! WARNING: Only one guess left!"
        end
        return "Too high!"
      end


    elsif  !@list_of_guesses.include?(num)
      if num < @secret_num
        @num_of_guesses -= 1
        @list_of_guesses << num
        if @num_of_guesses == 1
          return "Too low! WARNING: Only one guess left!"
        elsif @num_of_guesses == 0
          @has_lost = true
          return "You lost! The number was #{secret_num}"
        end
        return "Too low!"
      elsif num > @secret_num
        @num_of_guesses -= 1
        @list_of_guesses << num
        if @num_of_guesses == 1
          return "Too high! WARNING: Only one guess left!"
        elsif @num_of_guesses == 0
          @has_lost = true
          return "You lost! The number was #{secret_num}"
        end
        return "Too high!"
      end

    end



  end



end
