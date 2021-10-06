require 'docking_station'
require_relative 'helper_methods'

describe Van do
  
  let(:bike) { double(:bike, broken: false)}
  let(:broken_bike) { double(:broken_bike, broken: true, storage: [] ) }
  let(:docking_station) { double(:station, dock: broken_bike, storage: [ broken_bike]) }
  let(:garage) { double(:garage, garage_storage: [bike], fix: broken_bike) }
  
  describe "#station_collect" do
    it 'Allows the van to collect broken bikes from stations' do
      expect(subject.station_collect(docking_station)).to eq([])
      expect(subject.van_storage).to eq([broken_bike])
    end
  end
   
    describe "#storage_full?" do
      let(:docking_station) { double(:station, dock: broken_bike, storage: array) }
      xit 'Raises an error if it tries to exceed vans max capacity' do
        docking_station
        p docking_station
        van = Van.new
        docking_station.dock() 
        p docking_station.storage
        Van::VAN_MAX_CAPACITY.times { van.station_collect(docking_station) }
        p van.van_storage
         expect{ van.station_collect(Bike.new.broken) }.to raise_error("Cannot collect; max capacity reached.")
    end
  end

  describe "#garage_collect" do

    let(:bike_i) { Bike.new } # bike_instance
    let(:docking_station2) { double(:station, dock: bike_i, storage: [bike_i]) }
    let(:garage2) { double(:garage, garage_storage: [], fix: bike_i) }
    
    it 'Collects working bikes from the garage' do
      bike_i.report_broken
      docking_station2.dock(bike_i) 
      subject.station_collect(docking_station2)
      subject.garage_drop_off(garage2)
      garage2.fix
      expect(subject.garage_collect(garage2)).to eq([bike_i])
    end
  end
  
  describe "#station_drop_off" do
    it 'Allows the van to drop off working bikes at docking stations' do
      subject.garage_collect(garage) 
      expect(subject.station_drop_off(docking_station)).to eq([])
      expect(docking_station.storage).to eq([broken_bike, bike])
    end
  end

  describe "#garage_drop_off" do
    it 'Allows the van to drop off broken bikes at the garage' do
      subject.station_collect(docking_station)
      expect(subject.garage_drop_off(garage)).to eq([])
      expect(garage.garage_storage).to eq([bike, broken_bike])
    end
  end
end