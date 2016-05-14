class GuessingGame
	attr_reader :remaining_guesses, :has_won, :has_lost, :repeated_guesses, :secretnum
	attr_accessor :congrats_message

	def initialize(secretnum, remaining_guesses)
		@secretnum = secretnum
		@congrats_message = "Yay, you won!"
		@remaining_guesses = remaining_guesses
		@repeated_guesses = []
		@has_won = false
		@has_lost = false
	end

	def has_won?
		@has_won
	end

	def has_lost?
		@has_lost
	end

	def guess(num)
		output = ""

		if has_lost == false && has_won == false
			if !@repeated_guesses.include?(num)
				@remaining_guesses -= 1
				repeated_guesses << num
			end

			if num < @secretnum
				output = "Too low!"
			end

			if num > @secretnum
				output = "Too high!"
			end

			if num == @secretnum
				output = "#{@congrats_message} The number was #{@secretnum}"
				@has_won = true
				return output
			end

			if @remaining_guesses == 1
				output = "Too high! WARNING: Only one guess left!"
			end

			if @remaining_guesses == 0 && @has_won == false
				@has_lost = true
				output = "You lost! The number was #{@secretnum}"
				return output
			end
		end

		if @has_won
			output = "You already won. The number was #{@secretnum}"
		end

		if @has_lost
			output ="You already lost. The number was #{@secretnum}"
		end

		output
	end
end
