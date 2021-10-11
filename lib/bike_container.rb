module BikeContainer
  
  attr_reader :capacity, :storage
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @storage = []
  end

  def add_bike(bike)
    fail "#{self.class.name} full." if storage_full?
    fail "Bike already docked." if duplicate?(bike)
    @storage << bike
  end
  
  def remove_bike
    fail "#{self.class.name} empty." if storage_empty?
    @storage.pop
  end

  private

  def storage_full?
    @storage.count >= capacity
  end

  def storage_empty?
    @storage == []
  end

  def duplicate?(bike)
    @storage.include?(bike)
  end

  def create_vans
    i = 0
    van[i] = Van.new
    i += 1 if storage_full?
  end

end