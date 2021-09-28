require_relative 'bike'

class Docking_station

  def initialize
    @storage = []
  end

  def release_bike
    fail "No bikes to release." if @storage == []
    @storage.pop
  end

  def dock(bike)
    @storage << bike
  end
end