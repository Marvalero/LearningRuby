#!/usr/bin/ruby.rb

require "time_response"
require "rack"

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe TimeResponse do
  let(:app) { ->(env) { [200, env, "app"] } }

  let :middleware do
    TimeResponse.new(app)
  end

  def env_for(url, opts={})
    # It return the execution
    Rack::MockRequest.env_for(url, opts)
  end

  it "Checking URL" do
    code, env = middleware.call env_for('http://localhost:8080/?message=foo')
    expect(code).to eql(200)
    expect(env["QUERY_STRING"]).to eql('message=foo')
  end

end

