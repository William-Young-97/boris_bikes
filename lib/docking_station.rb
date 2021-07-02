require_relative "bike"

class DockingStation
  
  attr_reader :bike

  def initialize
    @station = []
  end
  
  def release_bike
    fail 'No bikes available' if empty
    @station.pop
  end

  def dock(bike)
    fail 'Too many bikes docked.' if full
    @station << bike
  end

  private

  def empty
    @station.empty?
  end
    
  def full
    @station.count >= 20
  end

end




