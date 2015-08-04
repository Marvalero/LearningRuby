require 'api/watch'
require 'rubygems'
require File.expand_path('../../lib/api/watch', __FILE__)
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

    context "Simple test" do
      require 'json'
      it "Get /watch" do
        put "/watch", {time: "16:00:10"}
        get "/watch"
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to eql("16:00:10")
      end
      it "Put /watch" do
        put "/watch", {time: "17:24:09"}
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
      it "Put /watch" do
        put "/watch", {time: "17:24:13", num_req: 8}
        expect(last_response.status).to eql(204)
        expect(last_response.body).to eql("")
      end
     end

    context "Bad request" do
      it "Put without time" do
        put "/watch"
        expect(last_response.status).to eql(400)
        expect(last_response.body).to eql("time is missing")
      end
      it "Put with bad time" do
        put "/watch", {time: "bad request"}
        expect(last_response.status).to eql(400)
      end
      it "Put with bad req_time" do
        put "/watch", {time: "16:00:10", num_req: "Bad request"}
        expect(last_response.status).to eql(400)
        expect(last_response.body).to eql("num_req is invalid")
      end
    end

    context "System tests" do
      it "Put and get" do
        put "/watch", {time: "16:00:10", num_req: 1}
        sleep(2)
        get "/watch"
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to match(/16:00:1\d/)
        get "/watch"
        Time.now.to_s.match(/(\d\d:\d\d:\d\d)/)
        expect(JSON.parse(last_response.body)["time"]).to eql($1)
       end
      it "put 2 request" do
        put "/watch", {time: "16:00:00", num_req: 2}
        get "/watch"
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to match(/16:00:0\d/)
        get "/watch"
        expect(last_response.status).to eql(200)
        expect(JSON.parse(last_response.body)["time"]).to match(/16:00:0\d/)
        get "/watch"
        Time.now.to_s.match(/(\d\d:\d\d:\d\d)/)
        expect(JSON.parse(last_response.body)["time"]).to eql($1)
        end
     end

  end
end
