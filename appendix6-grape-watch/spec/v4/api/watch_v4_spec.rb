require_relative '../spec_helper'
require 'rack/test'

describe "Using a real database" do
  include Rack::Test::Methods

  def app
    Watch::V4::API::WatchApi
  end

  describe "API V4" do
    let(:test_time) {Time.new(2004,3,2,4,2,2).to_i}

    let (:good_params) {{time: test_time, num_req: 1}.to_json}
    let(:headers) { { "Content-Type" => "application/json" } }

    let(:url_spam) {"/v4/watchs/spam"}
    let(:url_autod) {"/v4/watchs/autodelete"}

    context "Use case 1" do
      require 'json'
      it "Get /v4/watchs/:topic" do
        get url_autod
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_i)
      end
    end

    context "Use case 2" do
      let(:no_num_req_params) {{time: Time.new(2015,3,2,16,0,0).to_i }.to_json  }
      let(:bad_num_req_params) { { time: Time.now.to_i, num_req: "Bad request"}.to_json}
      it "Put /v4/watchs/spam" do
        put url_spam, good_params, headers
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
      it "Get /v4/watchs/spam" do
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

    describe "System tests" do
      context "Get not created topic"do
        require 'json'
        let (:url_watch_exist) {"/v4/watchs/no_exist"}
        it "get 2"do
          get url_spam
          expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_i)
        end
      end
       context "Put 1 request"do
        require 'json'
        let (:params_rep_one) {{time: test_time, num_req: 1}.to_json}
        it "get 1" do
          put url_spam, params_rep_one, headers
          get url_spam
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to eql(test_time)
        end
        it "get 2"do
          get url_spam
          expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_i)
        end
      end
      context "put 2 request" do
        let (:params_rep_two) {{time: test_time, num_req: 2}.to_json}
        require 'json'
        it "get 1" do
          put url_spam, params_rep_two, headers
          get url_spam
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to eql(test_time)
        end
        it "get 2" do
          get url_spam
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to eql(test_time)
        end
        it "get 3" do
          get url_spam
          expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_i)
        end
      end
      context "put inf request" do
        let (:params_rep_inf) {{time: test_time, num_req: 0}.to_json}
        require 'json'
        it "get 1" do
          put url_spam, params_rep_inf, headers
          get url_spam
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to eql(test_time)
        end
        it "get 2" do
          get url_spam
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to eql(test_time)
        end
        it "get 22" do
          20.times {get url_spam}
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to eql(test_time)
        end
      end
    end

  end
end


