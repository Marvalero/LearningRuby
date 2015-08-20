require_relative '../spec_helper'


describe "API V6" do
  include Rack::Test::Methods
  let(:mockdatabase) { Mocks::V6::ActionMock.new }
  let(:watch_configurator) {Watch::V6::Util::WatchConfigurator.new(action: mockdatabase.class)}

  def app
    watch_configurator.api
  end

  def env_for(url, opts={})
    Rack::MockRequest.env_for(url, opts)
  end
  let(:test_time) {Time.new(2004,3,2,4,2,2).to_i}

  let (:good_params) {{time: test_time, num_req: 1}.to_json}
  let(:headers) { { "Content-Type" => "application/json" } }

  let(:url_spam) {"/v6/watchs/spam"}
  let(:url_autod) {"/v6/watchs/autodelete"}


  describe "mock database" do
    context "Use case 1" do
      require 'json'
      it "Get /v6/watchs/:topic" do
        mockdatabase.time = Time.now.to_i
        get url_autod
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_i)
      end
    end
    context "Use case 2" do
      let(:no_num_req_params) {{time: Time.new(2015,3,2,16,0,0).to_i }.to_json  }
      let(:bad_num_req_params) { { time: Time.now.to_i, num_req: "Bad request"}.to_json}
      it "Put /watchs/spam" do
        put url_spam, good_params, headers
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
      it "Get /watchs/spam" do
        mockdatabase.time = test_time
        get url_spam
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to eql(test_time)
      end
      it "Put with no num_req" do
        put url_spam, no_num_req_params, headers
        expect(last_response.status).to eql(400)
        expect(last_response.body).to match("400 Bad Request")
      end
      it "Put without time" do
        put url_spam
        expect(last_response.status).to eql(400)
        expect(last_response.body).to match("400 Bad Request")
      end
      it "Put with bad num_req" do
        put url_spam, bad_num_req_params, headers
        expect(last_response.status).to eql(400)
        expect(last_response.body).to match("400 Bad Request")
      end
    end
  end
end


