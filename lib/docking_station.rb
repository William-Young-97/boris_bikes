require_relative "bike"

class DockingStation
  
  attr_reader :bike

  def initialize
    @station = []
  end
  
  def release_bike
    fail 'No bikes available' if @station.empty?
    @station.pop
  end

  def dock(bike)
    fail 'Too many bikes docked.' if @station.count >= 20
    @station << bike
  end
end




