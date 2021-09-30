require 'garage'

describe Garage do
  let(:bike) { Bike.new }
  let(:van) { double(:van, van_storage: bike, drop_off: garage.garage_storage.push(bike), collect: docking_station) }
  let(:docking_station) { double(:station, dock: bike, storage: [bike]) }
  let(:garage) { Garage.new }
  describe "#fix" do
    it 'Fixes broken bikes at the garage.' do
      bike.report_broken
      van.collect(docking_station)
      van.drop_off(garage)
      expect(garage.fix).to eq([bike])
    end
  end
end