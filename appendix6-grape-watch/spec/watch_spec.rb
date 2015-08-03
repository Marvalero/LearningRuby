require 'app/watch'

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "Watch" do
  subject {Watch.new}
  describe "Set Watch" do
    it "Actual time" do
      Time.now.to_s.match(/(\d\d:\d\d:\d\d)/)
      time = subject
      expect(time.get).to eql($1)
    end
    it "Actual time" do
      time = subject
      sleep(2)
      Time.now.to_s.match(/(\d\d:\d\d:\d\d)/)
      expect(time.get).to eql($1)
    end
   end
end
