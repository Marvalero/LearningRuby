#!/usr/bin/ruby.rb

require "switch"
require "router"

include LocalDevices

RSpec.configure do |c|
    c.color = true
      c.formatter = 'documentation'
end

describe "LocalDevices" do

  describe "Router" do
    let(:router1) {Router.new}
    context "#port2=" do
      it "2 ports" do
        expect(router1.port2= "123:2334:242").to eql("123:2334:242")
      end
      it "no mac in port1" do
        expect(router1.port1).to eql(nil)
      end
    end

    context "#see_all_ports" do
      it "showing" do
        expect(router1.see_all_ports).to eql(["port1","port2"])
      end
    end
  end

  describe "Switch" do
    let(:switch1) {Switch.new}
    context "#port4=" do
      it "4 ports" do
        expect(switch1.port4="233:52:32").to eql("233:52:32")
      end
    end
  end
end
