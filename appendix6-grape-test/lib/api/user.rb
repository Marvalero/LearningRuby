#!/usr/bin/ruby

class User
  attr_reader :name, :surname, :id
  def initialize(name,surname,id)
    @name = name
    @surname = surname
    @id = id
  end
  def to_s
    "Name:#{@name}   Surname:#{@surname}  ID:#{@id}"
  end
  def marshal_load(variables)
    puts variables.to_s
    @name = variables[0]
    @surname = "unknown"
    @id = variables[1]
  end
  def marshal_dump
    [name,surname,id]
  end
  def encode_with(properties)
    properties['name'] = name
    properties['surname'] = surname
    properties['id'] = id
  end
end

