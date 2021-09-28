require 'bike'

describe Bike do
  describe "#report_broken" do
    it 'Can be reported as broken' do
      expect(subject.report_broken).to be true
    end
  end
end