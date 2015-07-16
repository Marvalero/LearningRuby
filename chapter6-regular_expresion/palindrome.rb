#!/usr/bin/ruby

class Palindromo
  def initialize(palin)
    @palin = palin
  end

  def is_palindrome?
    match = /((.*),(.*))/.match(@palin)
    puts "#{$2}-#{$3}"
    $2.reverse==$3
  end
end

puts "Es palindromo" if Palindromo.new("Lo que,euq oL").is_palindrome?
