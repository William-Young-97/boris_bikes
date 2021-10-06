class Garage

  attr_reader :garage_storage

  def initialize
    @garage_storage = []
  end

  def fix
    @garage_storage.each { |bike| bike.broken = false }
  end
end