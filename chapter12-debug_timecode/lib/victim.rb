#!/usr/bin/ruby

require_relative "assassin"
include Dead

starting
Dead::starting("jajaja")

assassin = Dead::Assassin.new
assassin.kill if assassin.afilado?

puts "Esto no se ejecuta"

