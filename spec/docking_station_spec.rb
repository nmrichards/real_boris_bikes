require "docking_station"
require "bike"

describe DockingStation do
	let(:bike) { double :bike, broken?: false }

	it "returns docked bikes" do
		subject.dock(bike)
		expect(subject.bike_array).to include bike
	end

	it "docks a bike" do
		expect(subject.dock(bike)).to include bike
	end

	describe '#release_bike' do

		it "responds to release_bike" do
		expect(subject).to respond_to(:release_bike)
		end

		it 'releases a bikes' do
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raises an error when no bikes are available' do
			expect { subject.release_bike}.to raise_error 'No bikes available'
		end

		it 'does not release a broken bike' do
			allow(bike).to receive(:broken?).and_return(true)
			subject.dock(bike)
			expect { subject.release_bike}.to raise_error 'No bikes available'
		end

	end

	describe '#dock' do
		it 'raises an error when dock is full' do
			subject.capacity.times {subject.dock bike}
			expect {subject.dock(bike)}.to raise_error 'Dock is full'
		end
	end

	describe 'initialize' do
		subject {DockingStation.new}
		it 'sets a default capacity' do
			described_class::DEFAULT_CAPACITY.times do
				subject.dock(bike)
			end
			expect {subject.dock(bike) }.to raise_error "Dock is full"
		end
	end

end
