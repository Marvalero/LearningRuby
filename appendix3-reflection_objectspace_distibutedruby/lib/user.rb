#!/usr/bin/ruby

class User < Struct.new(:name, :mac)
  def to_s
    "Name:#{@name}   Mac:#{@mac}"
  end
  def marshal_load(variables)
    puts variables.to_s
    @name = variables[0]
    @mac = "unknown"
  end
  def marshal_dump
    [name,mac]
  end
  def encode_with(properties)
    properties['name'] = name
    properties['mac'] = mac
  end
end

