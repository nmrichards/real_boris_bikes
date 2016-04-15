require 'van'

describe Van do
  let(:bike)  { double :bike, broken?: true }
  let(:bike2) { double :bike, broken?: true }
  let(:bike3) { double :bike, broken?: false }
  let(:bike4) { double :bike, broken?: false }
  let(:garage) { double :garage }
  let(:docking_station) { double :docking_station, :bike_broken => [bike, bike2]}
  subject(:van) { described_class.new }
  it "collects broken bikes" do
    allow(docking_station).to receive(:select_broken_bikes).and_return([bike, bike2])
    expect(subject.collect_broken_bikes_from_station(docking_station)).to eq [bike, bike2]
  end

  it "delivers broken bikes" do
    allow(docking_station).to receive(:select_broken_bikes).and_return([bike, bike2])
    allow(garage).to receive(:receive_broken_bikes).and_return([bike,bike2])
    allow(garage).to receive(:bikes).and_return([bike,bike2])
    array = subject.collect_broken_bikes_from_station(docking_station)
    expect(subject.deliver_broken_bikes(garage)).to eq array
    expect(subject.bikes).to be_empty
  end

  it "picks up working bikes" do
    allow(garage).to receive(:load_working_bikes).and_return([bike3,bike4])
    array = subject.collect_working_bikes(garage)
    expect(subject.bikes).to eq [bike3,bike4]
  end

end
