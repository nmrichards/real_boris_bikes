require_relative 'bike'
require_relative 'van'

class DockingStation
  attr_reader :bike_array
  attr_accessor :capacity, :bike_broken
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

  def select_broken_bikes(number_of_bikes)
    array = []
    @bike_broken.each do |bike|
      array << bike if array.count < number_of_bikes
    end
    @bike_broken -= array
    array
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
