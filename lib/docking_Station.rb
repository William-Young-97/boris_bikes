require_relative 'bike'
require_relative 'van'
require_relative 'garage'
require_relative 'bike_container'

class Docking_station
  include BikeContainer

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

  def broken?
    @storage.reverse_each { |bike| return bike if bike.broken }
  end
end