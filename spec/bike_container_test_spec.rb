require_relative './support/shared_examples_bike_container'
require '../lib/bike_container'

class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do
  it_behaves_like BikeContainer
end

