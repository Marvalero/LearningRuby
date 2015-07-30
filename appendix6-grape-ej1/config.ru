require File.dirname(__FILE__) + "/app/api/base"

use Rack::Session::Cookie
run Rack::Cascade.new [Twitter::API]
