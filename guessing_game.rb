class GuessingGame

	attr_accessor :congrats_message, :secret_num, :guesses, :remaining_guesses


	def initialize(secret_num,remaining_guesses)
		@secret_num = secret_num
		@remaining_guesses = remaining_guesses
		@congrats_message = "Yay, you won!"
		@has_won = false
		@has_lost = false
		@guessed_numbers = []
	end

	def has_won?
		@has_won
	end

	def has_lost?
		@has_lost
	end
	
	def guess(number)
		output = ""
		if has_lost? == false && has_won? == false
			if !@guessed_numbers.include?(number)
				@remaining_guesses -= 1
				@guessed_numbers << number
			end

			if number < @secret_num
				output = "Too low!"
			end

			if number > @secret_num
				output = "Too high!"
			end

			if @remaining_guesses == 1
 				output = "Too high! WARNING: Only one guess left!"
 			end

 			if number == @secret_num
 				output = "#{@congrats_message} The number was #{@secret_num}"
 				@has_won = true
 				return output
 			end
 			if @remaining_guesses == 0 && @has_won == false
 				@has_lost = true
 				output = "You lost! The number was #{@secret_num}"
 				return output
 			end
 		end
 			if @has_won
			output = "You already won. The number was #{@secret_num}"
			end

			if @has_lost
			output ="You already lost. The number was #{@secret_num}"
			end
		output
	end
end

	# def guessed_nums
	# 	@guessed_numbers.each do |num|

	# end

		# @guessed_numbers.each do |exisiting_nums|
		# 	if exisiting_nums = number
		# 		puts "you guessed"
		# 	else
		# 		if number < @secret_num
		# 		return "Too low!"
		# 		@remaining_guesses -= 1
		# 		elsif number > @secret_num
		# 			return "Too high!"
		# 			@remaining_guesses -= 1
		# 		end
		# 	end
		# end

