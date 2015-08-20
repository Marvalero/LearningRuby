require 'rack'
require_relative '../../spec_helper'


describe "WatchConfigurator v6" do

  let(:mockdatabase) { Mocks::V6::ActionMock }
  let :configurator_default do
    Watch::V6::Util::WatchConfigurator.new()
  end
  let :configurator_mod do
    Watch::V6::Util::WatchConfigurator.new(action: mockdatabase)
  end

  def env_for(url, opts={})
    Rack::MockRequest.env_for(url,opts)
  end

  let(:env) {env_for('/v6/watchs/topic')}
  context "Real database" do
    it "returns 200" do
      app = configurator_default.api
      code = app.call(env)
      expect(code[0]).to eql(200)
    end
  end
  context "Mock database" do
    it "returns 200" do
      app= configurator_mod.api
      code = app.call(env)
      expect(code[0]).to eql(200)
    end
  end
end

