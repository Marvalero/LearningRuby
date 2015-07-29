#!/usr/bin/ruby

require "marshalling"
require "user"

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "Marshalling" do
  describe "#do_marshal" do
    context "store a object" do
      let(:obj) {User.new("Pepe","Blanco")}
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
end

