require "rubygems" # ruby1.9 doesn't "require" it though
require "thor"

class MyThorExecutable < Thor
  desc "start", "Start the server"
  def start
    require_relative 'lib/api/base'
    Rack::Handler::WEBrick.run API::V3::WatchApi
  end

  desc "test", "Running test"
  def test
    # require_relative 'spec/watch_api_spec'
    require 'rspec'
    require 'yaml'
    require 'rack/test'
    RSpec::Core::Runner.run(['spec/api/watch_v5_spec.rb'])
  end
end

MyThorExecutable.start
