#!/usr/bin/ruby

module Dead
  # Defining a module
  module Knife
    def afilado?
      true
    end
  end

  # Definning a method
  def starting(name="")
    at_exit {puts "Killing you #{name}"}
  end

  # Defining a class
  class Assassin
    include Knife
    def kill
      exit
    end
  end
end


