#!/usr/bin/ruby

require_relative "mainserver"


module TestNetwork
  module Refinator
    include LocalNetwork
    refine MainServer do
      def self.read_key(*args)
        "testing"
      end
    end
  end
end
