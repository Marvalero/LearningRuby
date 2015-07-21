#!/urs/bin/ruby

require "mathematician"

RSpec.configure do |c|
    c.color = true
    c.formatter = 'documentation'
end

describe Mathematician do
  subject {Mathematician.new}
  describe "#work" do
    context "Starting a work" do
      it "working" do
        expect(subject.work).to eql("Failed with operation £")
      end
    end
  end
  describe "#thinking" do
    context "Thinking about subjects" do
      it "ecuations" do
        expect(subject.thinking("ecuations")).to eql(["ecuations"])
      end
      it "ecuations, summer, winter" do
        expect(subject.thinking("ecuations","summer","winter")).to eql(["ecuations","summer","winter"])
      end
    end
  end
end

