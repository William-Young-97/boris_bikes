require_relative 'bike'

class Docking_station

MAX_CAPACITY = 20

  def initialize
    @storage = []
  end

  def release_bike
    fail "No bikes to release." if @storage == []
    @storage.pop
  end

  def dock(bike)
    fail "Bike already docked." if @storage.include?(bike)
    fail "Cannot dock; max capacity reached." if @storage.count >= MAX_CAPACITY
    @storage << bike
  end
end