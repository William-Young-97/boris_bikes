require_relative "bike"

class DockingStation
  
  DEFFAULT_CAPACTIY = 20
  
  attr_reader :bike
  attr_accessor :capacity

  def initialize(capacity = DEFFAULT_CAPACTIY)
    @station = []
    @capacity = capacity
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
    @station.count >= capacity
  end

end




