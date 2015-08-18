require_relative '../../spec_helper'
require 'rack/test'

context "Using mock database" do
  include Mocks
  include Rack::Test::Methods

  ApiDup = Watch::V4::API::WatchApi.dup

  class ApiDup
    helpers do
      include Mocks
      def weeejeee
        @@database ||= Mocks::DatabaseMock.new
      end
    end
  end

  def app
    ApiDup
  end

  describe "API V4" do
    let(:mock_database) {Mocks::DatabaseMock.new}
    let(:test_time) {Time.new(2004,3,2,4,2,2).to_i}

    let (:good_params) {{time: test_time, num_req: 2}.to_json}
    let(:headers) { { "Content-Type" => "application/json" } }

    let(:url_spam) {"/v4/watchs/spam"}
    let(:url_autod) {"/v4/watchs/autodelete"}

    context "Use case 1" do
      require 'json'
      it "Get /v4/watchs/:topic" do
        get url_spam
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_i)
      end
    end

    context "Use case 2" do
      let(:no_num_req_params) {{time: Time.new(2015,3,2,16,0,0).to_i }.to_json  }
      let(:bad_num_req_params) { { time: Time.now.to_i, num_req: "Bad request"}.to_json}
      it "Put /v4/watchs/spam" do
        put url_spam, good_params, headers
        mock_database.time=test_time
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
      it "Get /v4/watchs/spam" do
        get url_spam
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to match(test_time)
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


