require "docking_station"
require "bike"

describe DockingStation do
	it "responds to release_bike" do
		expect(subject).to respond_to(:release_bike)
	end

	it "working bike" do
		new_bike = Bike.new
		new_bike.working?.should be true
	end

	it "docks a bike" do
		bike = Bike.new
		expect(subject.dock(bike)).to eq bike
	end

	it "returns docked bikes" do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike).to eq bike
	end	

	

end
