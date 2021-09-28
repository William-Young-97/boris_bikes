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
  end
    
  describe "#dock" do
    it 'Docks a bike' do
      expect(subject.dock(bike)).to eq([bike])
    end 
    it 'Fails if docking station is full' do
      20.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error("Cannot dock; max capacity reached.")
    end    
  end 
end