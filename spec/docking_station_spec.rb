require 'docking_station'


describe Docking_station do
  let(:bike) { subject.release_bike }
    
  it 'Docking station responds to release bike method' do
    expect(Docking_station.new).to respond_to(:release_bike)
  end
  
  describe "#release_bike" do
    it 'Releases a bike' do
      expect(bike).to be_working
    end
  end
    
  describe "#dock" do
    it 'Docks a bike' do
      expect(subject.dock(bike)).to eq([bike])
    end 
  end 
end