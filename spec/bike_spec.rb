require 'bike'

describe Bike do
  describe "#working?" do
    it "Returns true if the bike is working" do
      expect(subject.working?).to be true
    end
  end
end