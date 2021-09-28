require 'docking_station'

describe Docking_station do
  it 'Docking station responds to release bike method' do
    expect(Docking_station.new).to respond_to(:release_bike)
  end
end  