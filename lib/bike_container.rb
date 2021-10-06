module BikeContainer
  
  attr_reader :capacity, :bikes
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    storage_full?
    @bikes << bike
  end

  private

  def storage_full?
    fail "Cannot dock; max capacity reached." if @bikes.count >= capacity
  end

end