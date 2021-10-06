require '../lib/bike_container'
shared_examples BikeContainer do

  let(:bike) { double(:bike, broken: false) }

  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  describe 'capacity' do
    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new(random_capacity)
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe '#add_bike' do
    it 'recieves a bike' do
      subject.add_bike(bike)
      expect(subject.storage).to eq([bike])
    end
    it 'Raises an error when full' do
      20.times { subject.add_bike (double(Bike.new)) }
      expect { subject.add_bike(bike) }.to raise_error("#{described_class.name} full.")
    end

  end

  describe '#remove_bike' do
    before(:each) { subject.add_bike(bike) }
    it 'returns a bike' do
      expect(subject.remove_bike).to eq(bike)
    end
    it 'removes the bike from the collection' do
      subject.remove_bike
      expect(subject.storage).to eq([])
    end
    it 'raises an error when empty' do
      subject.remove_bike
      expect { subject.remove_bike }.to raise_error("#{described_class.name} empty.")
    end
  end
end