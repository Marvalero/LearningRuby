require 'rack'
require 'util/api_configurator'
require 'util/database_v5'
require_relative '../mocks/database'

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "ApiConfigurator" do
  let(:app) { Struct.new(:configure) {
    def self.call(env)
      [200,[],[@@db]]
    end
    def self.configure(database)
      @@db= database
    end
    def self.db
      @@db
    end
  } }
  let(:mockdatabase) { Mocks::DatabaseMock.new }

  let :middleware do
    Util::V5::ApiConfigurator.new(app)
  end
  def env_for(url, opts={})
    Rack::MockRequest.env_for(url,opts)
  end

  it "No database" do
    # app.any_instance.stub(:call).and_return([200,[],["ok"]])
    code, env = middleware.call env_for('http://localhost:8080/watchs')
    expect(code).to eql(200)
    expect(app.db).to eql(Util::V5::Database)
  end
  it "Mock database" do
    code, env = middleware.call(env_for('http://localhost:8080/watchs'), {database: mockdatabase})
    expect(code).to eql(200)
    expect(app.db).to eql(mockdatabase)
  end
end

