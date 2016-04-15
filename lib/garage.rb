require_relative 'van'

class Garage

  def initialize
    @bikes = []
  end

  def receive_broken_bikes(van)
    @bikes = van.deliver_broken_bikes
    fix_bikes
  end

  def load_working_bikes(number)
    array = []
    @bikes.each do |bike|
      array << bike if array.count < number
    end
    @bikes_broken -= array
    array
  end

  private

  def fix_bikes
    @bikes.each {|bike| bike.report_working}
  end

end
