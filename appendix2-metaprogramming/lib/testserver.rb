#!/usr/bin/ruby

require_relative "mainserver"
require_relative "refinator"


module TestNetwork
# We will use refinements in the TestServer
  include LocalNetwork
  using Refinator
  #refine MainServer do
  #  def self.reader(*args)
  #    "testing"
  #  end
  #end
  class TestServer < MainServer
  end
end
