#require './lib/bike'

class DockingStation
 	attr_reader :docked_bikes

	def initialize
		@docked_bikes = []
	end

	def release_bike
		Bike.new
	end

	def dock(bike)
		@bike = bike 
	end

	def bike
		@bike 
	end	

end
