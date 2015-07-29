#!/usr/bin/ruby

require "marshalling"
require "user"

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "Marshalling" do
  let(:obj) {User.new("Pepe","Blanco")}
  describe "#do_marshal" do
    context "store a object" do
     it "store in file" do
        extend Marshalling
        expect(do_marshal("file.txt",obj).to_s).to match(/File:/)
        system("rm file.txt")
      end
      it "read from a file" do
        extend Marshalling
        do_marshal("file.txt",obj)
        expect(load_marshal("file.txt").to_s).to eql("Name:Pepe   Mac:unknown")
        system("rm file.txt")
      end
    end
  end

  describe "#store_yalm" do
    context "store User" do
      it "storing" do
        extend Marshalling
        expect(store_yalm("borrar.txt",obj).to_s).to match(/\d+/)
        system("rm borrar.txt")
      end
    end
  end
  describe "#load_yalm" do
    context "Loading previous object" do
      it "Loading" do
        extend Marshalling
        store_yalm("borrar.txt",obj).to_s
        expect(load_yalm("borrar.txt").to_s).to match(/Name:Pepe/)
        system("rm borrar.txt")
      end
    end
  end
end

