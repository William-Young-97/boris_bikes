class Van

  attr_accessor :van_storage
  VAN_MAX_CAPACITY = 10

  def initialize(capacity=VAN_MAX_CAPACITY)
    @van_storage = []
    @capacity = capacity
    @@van_fleet = {}
  end

  #look into .shift and custom del/push method
  # Make station_collect run automatically once bikes are docked
  def station_collect(station) # Possibly set an amount of bikes it can remove capped at 10?
    station.storage.map { |bike| @van_storage << bike } # Ideally remove bikes as I go (cannot del and iterate)
    # Clears all bikes if 11 taken (1 extra)
    fail "Cannot collect; max capacity reached." if storage_full? 
    station_clear_broken(station)
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

  def self.create_vans
    van = Van.new
    push_to_hash(van)
    p @@van_fleet
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

  def self.push_to_hash(van)
    @@van_fleet[1] = van
  end 
end

# Notes 

# Consider making a custom push and delete method
# Add a limiting capacity for the van with testing