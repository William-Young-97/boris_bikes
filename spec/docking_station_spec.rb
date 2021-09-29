require 'docking_station'


describe Docking_station do
  let(:bike) { Bike.new }
  it 'Docking station responds to release bike method' do
    expect(Docking_station.new).to respond_to(:release_bike)
  end
  
  describe "#release_bike" do
    it 'Releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end
    it 'Won\'t release a bike if docking station is empty' do
      expect{ subject.release_bike }.to raise_error("No bikes to release.") 
    end
    it 'Won\'t release a broken bike' do
      broken_bike = bike
      broken_bike.report_broken
      subject.dock(broken_bike)
      expect{ subject.release_bike }.to raise_error("Cannot release a broken bike.")
    end
    it 'Will release 1st unbroken bike' do
      good_bike = Bike.new
      subject.dock(good_bike)
      broken_bike = bike
      broken_bike.report_broken
      subject.dock(broken_bike)
      expect(subject.release_bike).to eq(good_bike)
    end
  end
    
  describe "#dock" do
    it 'Docks a bike' do
      expect(subject.dock(bike)).to eq([bike])
    end 
    it 'Fails if docking station is full' do
      Docking_station::MAX_CAPACITY.times { subject.dock double(:bike) }
      expect{ subject.dock double(:bike) }.to raise_error("Cannot dock; max capacity reached.")
    end
    it 'Allows you to set a max capacity' do
      limited_station = Docking_station.new(1)
      limited_station.dock double(:bike)
      expect{ limited_station.dock double(:bike) }.to raise_error("Cannot dock; max capacity reached.")
    end
    it 'Fails if you try to dock the same bike again' do
      subject.dock(bike)
      expect{ subject.dock(bike) }.to raise_error("Bike already docked.") 
    end   
  end 
end