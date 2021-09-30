require 'docking_station'

describe Van do
  let(:broken_bike) { double(:bike, broken: true) }
  let(:docking_station) { Docking_station.new } # How to mock this? Can't call .dock on double 
  describe "#collect" do
    it 'Allows the van to collect broken bikes from stations' do
      docking_station.dock(broken_bike)
      expect(subject.collect(docking_station)).to eq([])
      expect(subject.van_storage).to eq([broken_bike])
    end
  end
end