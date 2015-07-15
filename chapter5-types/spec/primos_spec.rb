#!/usr/bin/ruby

require "primos"

RSpec.configure do |c|
  c.color = true
end

describe Primos do
  describe ".new" do

    context "creating a prime" do
      it "create a prime with value 2" do
        expect(Primos.new(0).value).to eql(Primos.new(2).value)
      end
      it "create a prime with a number not prime" do
        expect(Primos.new(100).value).to eql(100)
      end
    end

  end

  describe "#<=>" do

    context "Checking primes" do
      it "Greather than" do
        expect(Primos.new(100)<=>Primos.new(34)).to eql(1)
      end
      it "Equal" do
        expect(Primos.new(50)<=>Primos.new(50)).to eql(0)
      end
      it "Smaller than" do
        expect(Primos.new(100)<=>Primos.new(200)).to eql(-1)
      end
    end

  end

  describe "#to_s" do
    context "Checking value" do
      it "Creating a prime" do
        expect(Primos.new(10).to_s).to eql("10")
      end
    end
  end

  describe "#succ" do
    context "Searching next prime" do
      it "Next prime" do
        expect(Primos.new(7).succ.value).to eql(Primos.new(11).value)
      end
    end
  end

  describe "#==" do
    context "Comparing primes" do
      it "Equals" do
        expect(Primos.new(8)==Primos.new(8)).to eql(true)
      end
      it "Not equals" do
        expect(Primos.new(8)==Primos.new(10)).not_to eql(true)
      end
    end
  end

  describe "Range" do
    context "Number between range" do
      it "Prime number" do
        require 'pry'; binding.pry
        expect((Primos.new(2)..Primos.new(50))===Primos.new(11)).to eql(true)
      end
    end
  end
end

