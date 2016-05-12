class GuessingGame
  attr_reader :secret_num, :guess
  def initialize(secret_num, num_of_guesses)
    @secret_num = secret_num
    @num_of_guesses = num_of_guesses
    @congrats_message = "Yay, you won!"
    @has_won = false
    @has_lost = false
    @list_of_guesses = []
  end

  def congrats_message
    @congrats_message
  end

  def congrats_message=(input)
    @congrats_message = input
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
    if @list_of_guesses.include?(num)
      if num < @secret_num
        return "Too low!"
      elsif num > @secret_num
        return "Too high!"
      end
    elsif  !@list_of_guesses.include?(num)
      if num < @secret_num
        @num_of_guesses -= 1
        @list_of_guesses << num
        return "Too low!"
      elsif num > @secret_num
        @num_of_guesses -= 1
        @list_of_guesses << num
        return "Too high!"
      end
    end
  end



end
