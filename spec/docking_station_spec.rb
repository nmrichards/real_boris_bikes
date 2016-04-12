require "docking_station"
require "bike"

describe DockingStation do

	it "working bike" do
		new_bike = Bike.new
		new_bike.working?.should be true
	end


	it "returns docked bikes" do
		bike = Bike.new
		subject.dock(bike)
		bike_array = []
		bike_array << bike
		expect(subject.bike_array).to eq bike_array
	end

	it "docks a bike" do
			bike = Bike.new
			expect(subject.dock(bike)).to eq bike
	end

	describe '#release_bike' do

		it "responds to release_bike" do
		expect(subject).to respond_to(:release_bike)
		end

		it 'releases a bikes' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raises an error when no bikes are available' do
			expect { subject.release_bike}.to raise_error 'No bikes available'
		end

	end



	describe '#dock' do
		it 'raises an error when dock is full' do
			subject.dock(Bike.new)
			expect {subject.dock Bike.new}.to raise_error 'Dock is full'
		end
	end



end
