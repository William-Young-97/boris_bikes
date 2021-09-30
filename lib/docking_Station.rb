require_relative 'bike'
require_relative 'van'

class Docking_station

MAX_CAPACITY = 20
attr_accessor :capacity, :storage
  def initialize(capacity=MAX_CAPACITY)
    @storage = []
    @capacity = capacity
  end

  def release_bike
    storage_empty?
    @storage.reverse_each { |bike| return bike if !bike.broken }
    broken?
  end

  def dock(bike)
    duplicate?(bike)
    storage_full?
    @storage << bike
  end
  
  private

  def storage_full?
    fail "Cannot dock; max capacity reached." if @storage.count >= capacity
  end

  def storage_empty?
    fail "No bikes to release." if @storage == []
  end
  
  def duplicate?(bike)
    fail "Bike already docked." if @storage.include?(bike)
  end

  def broken?
    fail "Cannot release a broken bike."
  end

end