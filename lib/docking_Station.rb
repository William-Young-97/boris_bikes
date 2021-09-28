require_relative 'bike'

class Docking_station

  def initialize
    @storage = []
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
    @storage << @bike
  end
end