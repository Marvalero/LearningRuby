require_relative '../../spec_helper'

describe "WatchApi" do
  include Rack::Test::Methods

  def app
    Watch::V1::API::WatchApi
  end

  describe "API V1" do
    let(:params) {{time: Time.new(2015,3,2,16,0,0).to_i }.to_json  }
    let(:headers) { { "Content-Type" => "application/json" } }
    let(:url) {"/v1/watch"}

    context "Simple test" do
      require 'json'
      it "Get /v1/watch" do
        get url
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to match(Time.now.to_s)
      end
      it "Put /v1/watch" do
        put url, params, headers
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
      it "Put /v1/watch" do
        put url, {time: Time.new(2016).to_i, num_req: 8}.to_json, headers
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
     end

    context "Bad request" do
      it "Put without time" do
        put url
        expect(last_response.status).to eql(400)
        expect(last_response.body).to match("400 Bad Request")
      end
      it "Put with bad num_req" do
        put url, { time: Time.now.to_i, num_req: "Bad request"}.to_json, headers
        expect(last_response.status).to eql(204)
      end
    end

    describe "System tests" do
      context "Put 1 request"do
        require 'json'
        it "get 1" do
          put url, {time: Time.new(2015,1,2,16,0,10).to_i, num_req: 1}.to_json, headers
          get url
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:10/)
        end
        it "get 2"do
          get url
          expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_s)
        end
      end
      context "put 2 request" do
        require 'json'
        it "get 1" do
          put url, {time: Time.new(2015,6,2,16,0,0).to_i, num_req: 2}.to_json, headers
          get url
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
        it "get 2" do
          get url
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
        it "get 3" do
          get url
          expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_s)
        end
      end
      context "put inf request" do
        require 'json'
        it "get 1" do
          put url,{time: Time.new(2016,3,2,16,0,0).to_i, num_req: 0}.to_json , headers
          get url
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
        it "get 2" do
          get url
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
        it "get 22" do
          20.times {get url}
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
      end
    end
  end
end
