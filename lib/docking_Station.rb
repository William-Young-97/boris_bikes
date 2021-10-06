require_relative 'bike'
require_relative 'van'
require_relative 'garage'


class Docking_station
  include BikeContainer

  attr_accessor :capacity, :storage
  MAX_CAPACITY = 20

  def initialize(capacity=MAX_CAPACITY)
    @storage = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes to release." if storage_empty?
    @storage.reverse_each { |bike| return bike if !bike.broken }
    fail "Cannot release a broken bike." if broken?
  end

  def dock(bike)
    duplicate?(bike)
    add_bike(bike)
  end
  
  private
  
  def duplicate?(bike)
    fail "Bike already docked." if @storage.include?(bike)
  end

  def broken?
    @storage.reverse_each { |bike| return bike if bike.broken }
  end
end