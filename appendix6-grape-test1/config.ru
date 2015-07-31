#require 'sinatra'
require 'grape'
require_relative 'lib/api/api.rb'

use Rack::Session::Cookie
run Rack::Cascade.new [API] #,Web]
