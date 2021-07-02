require "docking_station"

describe DockingStation do
  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end 

  describe "#dock" do
    it "It raises an error if more than 20 bike" do
    subject.capacity.times { subject.dock(Bike.new) }
    expect {subject.dock(Bike.new)}.to raise_error "Too many bikes docked."
    end
  end

  describe "#initialization" do
    subject { DockingStation.new}
    let(:bike) { Bike.new}
    it "defaults_capacity" do
      described_class::DEFFAULT_CAPACTIY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error "Too many bikes docked."
    end
  end


  it "bike is working" do
    bike1 = Bike.new
    subject.dock(bike1)
    bike = subject.release_bike
    expect(bike.working?).to eq(true) 
  end
  
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }
  
  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end
  
  xit "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq nil # Test doesnt show anything
  end

  it "Returns a default capacity" do
  expect(subject.capacity).to eq DockingStation::DEFFAULT_CAPACTIY
  end
end


