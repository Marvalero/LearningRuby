#!/usr/bin/ruby

require "gossip"

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "Gossip" do
  let(:methods) {":see_methods, :calling_secure, :system, :puts, :enable_tracepoint, :disable_tracepoint, :where_i_am"}
  describe "Using module" do
    context "extend" do
      class Extending
        extend Gossip
      end
      it ".see_methods" do
        expect(Extending.see_methods).to eql("Public:[], Singleton:[#{methods}]")
      end
      it ".calling_secure" do
        a = "Test Context"
        expect(Extending.calling_secure {a}).to eql("Test Context")
        expect(Extending.calling_secure {raise RuntimeError.new("test")}).to match(/Failed with operation /)
      end
      it ".system" do
        expect(Extending.system("pwd")).to match(/system\(pwd\) returned/)
      end
      it ".puts" do
        expect(Extending.puts "").to eql("Done")
      end
      # it ".enable_tracepoint" do
      #   Extending.enable_tracepoint(:end)
      #   expect(Extending.instance_eval{ module Modul ; end}).to match(/TracePoint/)
      # end
      it ".where_i_am" do
        expect(Extending.where_i_am.to_s).to match(/gossip_spec/)
      end
    end
    context "include" do
      class Including
        include Gossip
      end
      it "#see_methods" do
        expect(Including.new.see_methods).to eql("Public:[#{methods}]")
      end
    end
  end
end

