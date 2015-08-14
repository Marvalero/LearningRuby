require 'rack'
require 'util/api_configurator'
require 'util/action_db'
require_relative '../mocks/database'

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "ApiConfigurator" do
  let(:app) { Struct.new(:db) {
    def call(envi, database=nil)
      configure(database)
      [200,[],[db]]
    end
    def configure(database)
      @db= database || Util::V5::ActionDb.new
    end
    def db
      @db
    end
  }.new }
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
    expect(app.db.class).to eql(Util::V5::ActionDb)
  end
  it "Mock database" do
    code, env = middleware.call(env_for('http://localhost:8080/watchs'), {database: mockdatabase})
    expect(code).to eql(200)
    expect(app.db).to eql(mockdatabase)
  end
end

