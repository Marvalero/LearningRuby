#!/usr/bin/ruby

require "devices"
require "mainserver"

include LocalNetwork
RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "LocalNetwork" do
  describe "devices" do
    context "Adding 3 devices" do
      it "Adding" do
        4.times.each { LocalNetwork.instance_eval{@devices.add_device} }
        expect(LocalNetwork.instance_eval{@devices.add_device}).to eql(5)
      end
    end
  end

  describe "MainServer" do
    let(:instance) { Class.new(MainServer) }
    context "Set variables" do
      it "ram" do
        instance.ram=3
        expect(instance.ram).to eql("3GB")
      end
      it "rom" do
        expect(instance.rom="4GB").to eql("4GB")
      end
       it "os" do
         expect(instance.os="Linux").to eql("Linux")
      end
    end
    context "Input Oputput" do
      it "read" do
        expect(instance.read_keyboard(*("command".chars))).to eql("command".chars)
      end
      it "write" do
        expect(instance.write_screen(*("command".chars))).to eql(nil)
      end
    end
  end

  describe "TestServer" do
    require "testserver"
    let(:testserver) { Class.new(TestServer) }
    context "Input Output" do
      it "read" do
        expect(testserver.read_key(*("command".chars))).to eql("testing")
      end
    end
  end
end

