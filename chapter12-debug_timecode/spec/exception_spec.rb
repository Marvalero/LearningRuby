#!/usr/bin/ruby

require "operation_exception"

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe OperationException do

  describe ".new" do
    context "Creating a exception" do
      it "Option $" do
        expect(OperationException.new("%").operation).to eql("%")
      end
      it "Raise error" do
        expect{raise OperationException.new("&")}.to raise_error(OperationException)
      end
    end
  end
end

