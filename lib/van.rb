class Van

  attr_accessor :van_storage, :capacity
  VAN_MAX_CAPACITY = 10

  def initialize
    @van_storage = []
    @capacity = VAN_MAX_CAPACITY
  end

  #look into .shift and custom del/push method
  
  def station_collect(station) # Possibly set an amount of bikes it can remove capped at 10?
    station.storage.map { |bike| @van_storage << bike } # Ideally remove bikes as I go (cannot del and iterate)
    station_clear_broken(station) # Clears all bikes if 11 taken (1 extra)
    fail "Cannot collect; max capacity reached." if storage_full? 
    # station_clear_broken(station) Runtime fail if over 11 bikes in storage 
  end

  def garage_collect(garage)
    garage.garage_storage.map { |bike| @van_storage << bike if !bike.broken }
    garage_clear_working(garage)
  end

  def station_drop_off(station)
    @van_storage.map { |bike| station.storage << bike if !bike.broken }
    van_clear_working(station)
  end

  def garage_drop_off(garage)
    @van_storage.map { |bike| garage.garage_storage << bike if bike.broken }
    van_clear_broken(garage)
  end

  private

  def garage_clear_working(garage)
    garage.garage_storage.delete_if { |bike| !bike.broken }
  end

  def station_clear_broken(station) 
    station.storage.delete_if { |bike| @van_storage.include?(bike) }
  end

  def van_clear_broken(garage)
    @van_storage.delete_if { |bike| bike.broken }
  end

  def van_clear_working(station)
    @van_storage.delete_if { |bike| !bike.broken }
  end

  def storage_full?
    @van_storage.count > @capacity
  end
end

# Notes 

# Consider making a custom push and delete method
# Add a limiting capacity for the van with testing