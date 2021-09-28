require_relative 'bike'

class Docking_station

MAX_CAPACITY = 20

  def initialize
    @storage = []
  end

  def release_bike
    storage_empty?
    @storage.pop
  end

  def dock(bike)
    duplicate?(bike)
    storage_full?
    @storage << bike
  end

  private

  def storage_full?
    fail "Cannot dock; max capacity reached." if @storage.count >= MAX_CAPACITY
  end

  def storage_empty?
    fail "No bikes to release." if @storage == []
  end
  
  def duplicate?(bike)
    fail "Bike already docked." if @storage.include?(bike)
  end

end