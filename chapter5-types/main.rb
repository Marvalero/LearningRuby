#!/usr/bin/ruby

class Primos
  attr_reader :value

  @@num_primos =[]

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
    found=true
    while found==true
      found=false
      @@num_primos.each do |primo|
        if @value%primo == 0
          found=true
        end
      end
      if found==true
        @value = @value+1
      end
    end
    @@num_primos[@@num_primos.length] = @value
    Primos.new(@value+1)
  end
end

def four
  (1..4)
end


p four.to_a

puts "Rango correcto" if four===3

puts "Number: #{ def four
                   4
                 end
                 p four }"
# We've rewritted the method
p four

# Creando una clase rango
r1 = Primos.new(2)
r2 = Primos.new(100)
(r1..r2).to_a.each {|obj_primo| print obj_primo.value, " "}
puts

puts "11 es un numero primo " if (r1...r2)===11
puts "12 no es un numero primo" if ! (12===(r1..r2))

