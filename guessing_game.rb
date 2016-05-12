class GuessingGame

attr_accessor :congrats_message, :remaining_guesses

	def initialize(secret_number, num_guesses)
		@secret_number = secret_number
		@num_guesses = num_guesses
		@congrats_message = congrats_message
		@remaining_guesses = remaining_guesses
	end


end