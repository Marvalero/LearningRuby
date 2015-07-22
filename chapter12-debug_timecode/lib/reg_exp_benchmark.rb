#!/usr/bin/ruby

require 'benchmark'
include Benchmark

block = lambda {|string,reg_exp| puts "#{reg_exp.inspect}\t- #{reg_exp.match(string).pre_match}->#{reg_exp.match(string)[0]}<-#{reg_exp.match(string).post_match}"}
block_no_puts = lambda {|string,reg_exp|  "#{reg_exp.inspect}\t- #{reg_exp.match(string).pre_match}->#{reg_exp.match(string)[0]}<-#{reg_exp.match(string).post_match}"}

block.call("Hello world", /o/)
block.call("Helloduuud world", /d$/)
block.call("wHello world waaaw w", /^w/)

# Character Classes
bm(6) do |x|
  x.report("prueba1") { 100_000.times { block_no_puts.call("wHello world waaaw w", /[^w]/)}}
  x.report("prueba2") { 100_000.times { block_no_puts.call("wHello world waaaw w", /[aeiou]/) }}
  # x.report("puts") { 100_000.times { puts "Hellooo" + " world"  }}
  # x.report("print") { 100_000.times { print "Hello ", "world\n" }}
  x.report("prueba3") { 100_000.times { block_no_puts.call("wHello world waaaw w", /[A-Fa-f][^aeiou]/) }}
end
#
block.call("wHello world waaaw w", /\s/)
block.call("wHello world 4 waaaw 5 w", /\d/)
block.call("wHello world waaaw w", /jajaja|\w+/)

#
block.call("wHello world waaaw w", /w.a/)
block.call("wHello world waaaw w", /wa{1,4}/)
block.call("wHello world waaaw w", /(?a)or/)

# GSUB
puts "jajaja".gsub(/a/,"A")
puts "jajaja".sub(/a/,"A")
puts "jajejijoju".gsub(/[aeiou]/) {|match| match.upcase}
puts "jajajaja".sub(/(ja).(.)/, '->\1<- ->\2<-')



