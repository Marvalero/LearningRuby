#!/usr/bin/ruby

require "calculator"

RSpec.configure do |c|
    c.color = true
      c.formatter = 'documentation'
end

describe Calculator do
  subject {Calculator.new}
  describe "#calculate" do
    context "Some operations" do
      it "operation: *" do
        expect(subject.calculate("*",3,2)).to eql(6)
      end
      it "operation: +" do
        expect(subject.calculate("+",3,2)).to eql(5)
      end
      it "operation: %" do
        expect(subject.calculate("%",3,2)).to eql(1.0)
      end
      it "operation: /" do
        expect(subject.calculate("/",3,2)).to eql(1.5)
      end
      it "operation invalid" do
        expect{subject.calculate("&",3,2)}.to raise_error(OperationException)
      end
    end
  end
end

