require_relative "bike"

class DockingStation
  
  DockingStation::DEFFAULT_CAPACTIY = 20
  
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
    @station.count >= DEFFAULT_CAPACTIY
  end

end




