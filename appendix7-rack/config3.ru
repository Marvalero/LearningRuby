
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

class Middleware
  def initialize(app)
    @app = app
  end

  def call(env)
    # We shoe the env var
    puts "Var env: #{env.inspect}"
    @app.call(env)
  end
end

class BlogAuth < Rack::Auth::Basic

  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/index.xml'
      @app.call(env)  # skip auth
    else
      super           # perform auth
    end
  end
end
# this returns an app that responds to call cascading down the list of
# middlewares. Technically there is no difference between "use" and
# "run". "run" is just there to illustrate that it's the end of the
# chain and it does the work.
app = Rack::Builder.new do
  use BlogAuth, "blog" do |username, password|
      [username, password] == ['admin', 'admin1']
  end
  use Middleware
  run HelloWorldApp        # Say Hello
end

Rack::Server.start :app => app

