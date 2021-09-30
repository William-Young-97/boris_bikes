class Van

  attr_reader :van_storage

  def initialize
    @van_storage = []
  end

  def collect(station)
    station.storage.map { |bike| @van_storage << bike if bike.broken }
    clear_broken(station)
  end

  private

  def clear_broken(station)
    station.storage.delete_if { |bike| bike.broken }
  end

end