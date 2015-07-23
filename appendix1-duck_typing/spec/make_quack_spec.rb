#!/usr/bin/ruby

require "make_quack"
require "duck"
require "duck_record"

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe MakeQuack do

  describe "#start" do

    context "quacking things" do
      it "a duck" do
        expect(MakeQuack.new.start(Duck.new)).to eql("Quack")
      end
      it "a record" do
        expect(MakeQuack.new.start(DuckRecord.new)).to eql("Quack")
      end
      it "a string" do
        expect(MakeQuack.new.start("")).to eql(nil)
      end
    end
  end
  describe "#to_proc" do
    context "MakeQuack.to_proc"
      it "quacking one duck" do
        expect( Duck.new.to_a.map(&(MakeQuack.new)) ).to eql(["Quack"])
      end
      it "quacking three ducks" do
        expect( (Duck.new*3).map(&(MakeQuack.new)) ).to eql(["Quack","Quack","Quack"])
      end
    end

  end

