require_relative '../spec_helper'


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
    it "call WatchApi.action" do
      fake_api = double("Watch::V6::API::WatchApi")
      expect(fake_api).to receive(:action=).with(an_instance_of(Watch::V6::Util::ActionDb))
      expect(fake_api).to receive(:new)
      Watch::V6::Util::WatchConfigurator.new(api: fake_api)
    end
    it "returns 200" do
      app = configurator_default.api
      code = app.call(env)
      expect(code[0]).to eql(200)
    end
  end
  context "Mock database" do
    it "call WatchApi.action" do
      fake_api = double("Watch::V6::API::WatchApi")
      expect(fake_api).to receive(:action=).with(an_instance_of(Mocks::V6::ActionMock))
      expect(fake_api).to receive(:new)
      Watch::V6::Util::WatchConfigurator.new(api: fake_api,action: mockdatabase)
    end
    it "returns 200" do
      app= configurator_mod.api
      code = app.call(env)
      expect(code[0]).to eql(200)
    end
  end
end

