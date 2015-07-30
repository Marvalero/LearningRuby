#!/usr/bin/env ruby
require "rubygems" # ruby1.9 doesn't "require" it though
require "thor"

class MyThorExecutable < Thor
  desc "foo", "Prints foo"
  def foo
    puts "foo"
  end
end

MyThorExecutable.start
