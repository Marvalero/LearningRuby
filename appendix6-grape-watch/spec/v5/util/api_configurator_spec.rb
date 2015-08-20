require 'rack'
require_relative '../spec_helper'


describe "ApiConfigurator v5" do
  let(:app) { Struct.new(:db) {
    def call(envi, database=nil)
      configure(database)
      [200,[],[db]]
    end
    def configure(database)
      @db= database || Watch::V5::Util::ActionDb.new
    end
    def db
      @db
    end
  }.new }
  let(:mockdatabase) { Mocks::DatabaseMock.new }

  let :middleware do
    Watch::V5::Util::ApiConfigurator.new(app)
  end
  def env_for(url, opts={})
    Rack::MockRequest.env_for(url,opts)
  end

  it "No database" do
    # app.any_instance.stub(:call).and_return([200,[],["ok"]])
    code, env = middleware.call env_for('http://localhost:8080/watchs')
    expect(code).to eql(200)
    expect(app.db.class).to eql(Watch::V5::Util::ActionDb)
  end
  it "Mock database" do
    code, env = middleware.call(env_for('http://localhost:8080/watchs'), {database: mockdatabase})
    expect(code).to eql(200)
    expect(app.db).to eql(mockdatabase)
  end
end

