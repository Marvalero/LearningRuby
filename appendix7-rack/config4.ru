require_relative "lib/time_response"

class HelloWorldApp
  def self.call(env)
    HelloWorld.new.response
  end
end

class HelloWorld
  def response
    [200, {}, ['Hello World']]
  end
end

app = Rack::Builder.new do
  use TimeResponse
  run HelloWorldApp        # Say Hello
end

Rack::Server.start :app => app

