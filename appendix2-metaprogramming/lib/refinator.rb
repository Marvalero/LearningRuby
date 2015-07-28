#!/usr/bin/ruby

require_relative "mainserver"


module TestNetwork
  include LocalNetwork
  module Refinator
    refine MainServer do
      def self.read_key(*args)
        "testing"
      end
    end
  end
end
