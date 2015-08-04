require 'api/watch'
require 'rack/test'

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "WatchApi" do
  include Rack::Test::Methods
  def app
    WatchApi
  end

  describe "API" do
    let(:params) {{hour: 16,min: 0,sec: 0}.to_json  }
    let(:headers) { { "Content-Type" => "application/json" } }

    context "Simple test" do
      require 'json'
      it "Get /watch" do
        get "/watch"
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to match(Time.now.to_s)
      end
      it "Put /watch" do
        put "/watch", params, headers
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
      it "Put /watch" do
        put "/watch", {day: "17", num_req: 8}.to_json, headers
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
     end

    context "Bad request" do
      it "Put without time" do
        put "/watch"
        expect(last_response.status).to eql(400)
        expect(last_response.body).to eql("400 Bad Request")
      end
      it "Put with bad hour" do
        put "/watch", {hour: "bad request"}.to_json, headers
        expect(last_response.status).to eql(204)
      end
      it "Put with bad req_time" do
        put "/watch", {day: "16", num_req: "Bad request"}.to_json, headers
        expect(last_response.status).to eql(204)
      end
    end

    describe "System tests" do
      context "Put 1 request"do
        require 'json'
        it "get 1" do
          put "/watch", {hour:16, min:0, sec:10, num_req: 1}.to_json, headers
          get "/watch"
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:10/)
        end
        it "get 2"do
          get "/watch"
          expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_s)
        end
      end
      context "put 2 request" do
        require 'json'
        it "get 1" do
          put "/watch", {hour:16, min:0, sec:0, num_req: 2}.to_json, headers
          get "/watch"
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
        it "get 2" do
          get "/watch"
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
        it "get 3" do
          get "/watch"
          expect(JSON.parse(last_response.body)["time"]).to eql(Time.now.to_s)
        end
      end
      context "put inf request" do
        require 'json'
        it "get 1" do
          put "/watch",{hour:16, min:0, sec:0, num_req: 0}.to_json , headers
          get "/watch"
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
        it "get 2" do
          get "/watch"
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
        it "get 22" do
          20.times {get "/watch"}
          expect(last_response.status).to eql(200)
          expect(JSON.parse(last_response.body)["time"]).to match(/16:00:00/)
        end
      end
    end
  end
end
