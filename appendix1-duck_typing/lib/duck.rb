#!/usr/bin/ruby

class Duck
  attr_reader :quacker
  def initialize
    @quacker = "Quack"
  end
  def quack
    @quacker
  end
  def to_a
    [self]
  end
  def *(num)
    num.times.collect { | ind | if ind == 0 then self else Duck.new end}
  end
  def coerce(other)
    if Duck === other
      [self, other]
    else
      [self, Duck.new]
    end
  end
  def +(other)
    if Duck === other
      iother = other.quacker
    else
      self.coerce(other)
    end
  end
end

