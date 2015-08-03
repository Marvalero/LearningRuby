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

# this returns an app that responds to call cascading down the list of
# middlewares. Technically there is no difference between "use" and
# "run". "run" is just there to illustrate that it's the end of the
# chain and it does the work.
app = Rack::Builder.new do
  use TimeResponse
  run HelloWorldApp        # Say Hello
end

Rack::Server.start :app => app

