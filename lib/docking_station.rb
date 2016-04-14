require './lib/bike'

class DockingStation
  attr_reader :bike_array
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike_array = []
    @capacity = capacity
    @bike_broken = []
  end

	def release_bike
    fail 'No bikes available' if empty?
    @bike_array.pop
	end

	def dock(bike)
		fail 'Dock is full' if full?
    if bike.broken?
      @bike_broken << bike
    else
      @bike_array << bike
    end
  end

  private

  def full?
    @bike_array.count >= @capacity
  end

  def empty?
    @bike_array.empty?
  end
end
