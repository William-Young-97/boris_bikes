module BikeContainer
  
  attr_reader :capacity, :storage
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @storage = []
  end

  def add_bike(bike)
    fail "#{self.class.name} full." if storage_full?
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

end