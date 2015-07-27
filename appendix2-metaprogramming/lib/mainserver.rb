#!/usr/bin/ruby

require_relative "inputs_outputs"

module LocalNetwork
  # 1- Our singleton class
  class MainServer
    # We add some class method with extend (first way)
    extend InputsOutputs

    @os= "Default"
    @ram= "2GB"
    @rom= "100GB"
    #   a- Add variable: first way
    def self.ram= mem
      @ram= "#{mem}GB"
    end
    def self.ram
      @ram
    end
    #   b- Add variable: second way
    class << self
      attr_accessor :os, :rom
      # We add some class method with prepend or include (second way)
      # prepend InputsOutputs
    end
  end

end

