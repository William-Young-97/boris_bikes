class Van

  attr_reader :van_storage

  def initialize
    @van_storage = []
  end

  def collect(station)
    station.storage.map { |bike| @van_storage << bike if bike.broken }
    station_clear_broken(station)
  end

  def drop_off(garage)
    @van_storage.map { |bike| garage.garage_storage << bike if bike.broken }
    van_clear_broken(garage)
  end

  private

  def station_clear_broken(station)
    station.storage.delete_if { |bike| bike.broken }
  end

  def van_clear_broken(garage)
    @van_storage.delete_if { |bike| bike.broken }
  end

end