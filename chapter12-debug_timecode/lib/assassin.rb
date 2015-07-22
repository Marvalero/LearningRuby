#!/usr/bin/ruby

class Dead
  def initialize
    at_exit {puts "Killing you"}
  end
  def kill
    exit
  end
end


