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
  describe "" do
    require 'json'
    it "Get /watch" do
      put "/watch", {time: "16:00:00"}
      get "/watch"
      expect(last_response.status).to eql(200)
      expect(JSON.parse(last_response.body)["time"]).to eql("16:00:00")
    end
    it "Put /watch" do
      put "/watch", {time: "17:24:09"}
      expect(last_response.status).to eql(204)
      expect(last_response.body).to eql("")
    end
    it "Put BAD REQUEST" do
      put "/watch"
      expect(last_response.status).to eql(400)
      expect(last_response.body).to eql("time is missing")
    end
   end
end
