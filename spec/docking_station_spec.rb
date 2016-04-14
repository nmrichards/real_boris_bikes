require "docking_station"
require "bike"

describe DockingStation do

	it "working bike" do
		bike = Bike.new
		expect(bike.working?).to be true
	end


	it "returns docked bikes" do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike_array).to include bike
	end

	it "docks a bike" do
		bike = Bike.new
		expect(subject.dock(bike)).to include bike
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
			subject.capacity.times {subject.dock Bike.new}
			expect {subject.dock Bike.new}.to raise_error 'Dock is full'
		end
	end

	describe 'initialize' do
		subject {DockingStation.new}
		let(:bike) { Bike.new }
		it 'sets a default capacity' do
			described_class::DEFAULT_CAPACITY.times do
				subject.dock(bike)
			end
			expect {subject.dock(bike) }.to raise_error "Dock is full"
		end
	end

end
