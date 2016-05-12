class GuessingGame
  attr_reader :num_of_guesses
  attr_accessor :message

  def initialize(secret_number, num_of_guesses)
    @secret_number = secret_number
    @num_of_guesses = num_of_guesses
    @message = message
  end

  def congrats_message(message= "Yay, you won!")
    return message
  end
end
