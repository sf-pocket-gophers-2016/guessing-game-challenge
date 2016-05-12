class GuessingGame

attr_accessor :congrats_message, :remaining_guesses
attr_accessor :has_won, :has_lost

	def initialize(secret_number, num_guesses)
		@secret_number = secret_number
		@num_guesses = num_guesses
		@congrats_message = congrats_message
		@remaining_guesses = remaining_guesses
	end

  def has_won?
    @won = false
  end

  def has_lost?
    @lost = false
  end


end
