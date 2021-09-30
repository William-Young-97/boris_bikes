require 'docking_station'

describe Van do
  let(:broken_bike) { double(:bike, broken: true) }
  let(:docking_station) { Docking_station.new } # How to mock this? Can't call .dock on double 
  let(:garage) { Garage.new }
  describe "#collect" do
    it 'Allows the van to collect broken bikes from stations' do
      docking_station.dock(broken_bike)
      expect(subject.collect(docking_station)).to eq([])
      expect(subject.van_storage).to eq([broken_bike])
    end
  end

  describe "#drop_off" do
    it 'Allows the van to drop off broken bikes at the garage' do
      docking_station.dock(broken_bike)
      subject.collect(docking_station)
      expect(subject.drop_off(garage)).to eq([])
      expect(garage.garage_storage).to eq([broken_bike])
    end
  end
end