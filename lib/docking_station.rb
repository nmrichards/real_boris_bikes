#require './lib/bike'

class DockingStation
	def release_bike
    	fail 'No bikes available' unless @bike
		@bike
	end

	def dock(bike)
		fail 'Dock is full' if @bike
		@bike = bike
	end

	def bike
		@bike
	end

end
