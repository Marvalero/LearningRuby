#!/usr/bin/env ruby
require "rubygems" # ruby1.9 doesn't "require" it though
require "thor"

class MyThorExecutable < Thor
  desc "start", "Start the server"
  def start
    require_relative 'lib/api/watch'
    Rack::Handler::WEBrick.run WatchApi
  end

  desc "test", "Running test"
  def test
    # require_relative 'spec/watch_api_spec'
    require 'rspec'
    require 'yaml'
    require 'rack/test'
    RSpec::Core::Runner.run(['spec'])
  end
end

MyThorExecutable.start
