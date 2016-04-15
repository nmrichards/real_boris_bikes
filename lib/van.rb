require_relative 'docking_station'
require_relative 'garage'

class Van
  DEFAULT_CAPACITY = 2
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def collect_broken_bikes_from_station(station)
    @bikes = station.select_broken_bikes(remaining_capacity)
  end

  def deliver_broken_bikes(location)
    location.receive_broken_bikes(self)
    @bikes = []
    location.bikes
  end

  def collect_working_bikes(garage)
    @bikes = garage.load_working_bikes(remaining_capacity)
  end

  private

  def remaining_capacity
    @capacity - @bikes.count
  end

end
