class Bike_helper 

  def generate_bike_array(amount)
    bike_string = 20.times { Bike.broken_bike * amount }
    bike_string.chars.each_slice(4).map(&:join)
  end

end

