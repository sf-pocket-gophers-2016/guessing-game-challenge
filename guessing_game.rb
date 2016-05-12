class GuessingGame
	attr_reader :secret_num 
	attr_accessor :congrats_message, :guess_num, :previous_guesses


	def initialize(secret_num, guess_num)
		@secret_num = secret_num
		@guess_num = guess_num
		@congrats_message = "Yay, you won!"
		@has_won = false
		@has_lost = false
		@previous_guesses = []
	end

	def remaining_guesses
		@guess_num
	end

	def has_won?
		@has_won
	end

	def has_lost?
		@has_lost
	end

	def guess(num)
		if @previous_guesses.include?(num)
			if num < @secret_num
				return "Too low!"
			elsif num > @secret_num
				return "Too high!"
			end
		else 
			if num < @secret_num
				@guess_num -= 1
				@previous_guesses << num
				return "Too low!"
			elsif num > @secret_num
				@guess_num -= 1
				@previous_guesses << num
				return "Too high!"
			end
		end
	end

end