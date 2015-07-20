#!/usr/bin/ruby

class Primos
  attr_reader :value


  def initialize(value)
    if value > 2
      @value = value
    else
      @value = 2
    end
  end
  def <=>(other)
    @value <=> other.value
  end
  def to_s
    @value.to_s
  end
  def succ
    @value = value+1 if value != 2
    found=true
    while found==true
      found=false
      (2..@value-1).each do |primo|
        if @value%primo == 0
          found=true
        end
      end
      if found==true
        @value = @value+1
      end
    end
    if @value==2
      @value=3
    end
    Primos.new(@value)
  end
  def ==(other)
    other.value==@value
  end
end


