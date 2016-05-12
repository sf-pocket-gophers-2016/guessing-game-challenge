class GuessingGame
  attr_reader :secret_num, :guess
  def initialize(secret_num, num_of_guesses)
    @secret_num = secret_num
    @num_of_guesses = num_of_guesses
    @congrats_message = "Yay, you won!"
    @has_won = false
    @has_lost = false
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
end
