
#SEBA's example of walking through classes

# class Bike

# 	attr_reader :brand

# 	def initialize(args ={})
# 		@brand = args[:brand]
# 		@year = args[:year]
# 		@color = args[:color] 
# 	end


# 	def self.create_bikes_array(array_of_args)
# 		array_of_args.map do |args|
# 			Bike.new(args)
# 		end

# 	end

# 	def self.return_an_inst_of_bike(bike_arg_hash)
# 		p self
# 		Bike.new(bike_arg_hash)
		
# 	end

# 	def create_bikes_array(array_of_args)
# 		p self
# 	end

# end


# b1 = {brand: "scott", year: 2016, color: "red"}
# b2 = {brand: "specialized", year: 2016, color: "blue"}
# b3 = {brand: "Releigh", year: 2016, color: "white"}

# bike = Bike.new(b1)
# # p Bike.create_bikes_array([b1,b2,b3])
# # p bike 
# # p Bike.return_an_inst_of_bike(b1)
# bike.create_bikes_array("hi")


# arr =  Bike.create_bikes_array([b1, b2, b3]) 
# p arr[0][:brand]

# [< Instance of Bike 1>, <Instance of Bike 2>, <Instance of Bike 3>]

# Stretch print this baby ["scott", "specialized", "Releigh"]