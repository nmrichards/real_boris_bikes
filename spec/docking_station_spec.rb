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
		expect(subject).to respond_to(:dock_bike)
	end

	#testing

	# one liner syntax:
	# it { is_expected.to respond_to :release_bike }

end
