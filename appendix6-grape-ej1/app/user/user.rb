#!/usr/bin/ruby

class User < Struct.new(:name, :mac)
  def to_s
    "Name:#{self.name}   Mac:#{mac}"
  end
end

