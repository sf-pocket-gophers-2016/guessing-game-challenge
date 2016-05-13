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

		return "You already won. The number was #{@secret_num}" if @has_won

		return "You already lost. The number was #{@secret_num}" if @has_lost		

		if num == @secret_num
			@guess_num -= 1
			@has_won = true
			return @congrats_message + " The number was #{@secret_num}"  
		end

		if @guess_num == 1 && num != @guess_num && !@previous_guesses.include?(num)
			@guess_num -= 1
			@has_lost = true
			return "You lost! The number was #{@secret_num}"
		end

		feedback = ""

		if num < @secret_num
			feedback += "Too low!"
		elsif num > @secret_num
			feedback += "Too high!"			 
		end

		if !@previous_guesses.include?(num)
			@previous_guesses << num
			@guess_num -= 1
		end

		if @guess_num == 1	
			feedback += " WARNING: Only one guess left!"
		end	
		return feedback					

	end

end