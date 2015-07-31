require 'spec_helper'

describe API do
  include Rack::Test::Methods

  def app
    API
  end

  describe API do
    describe "GET /hello" do
      it "returns world" do
        get "/hello"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to match(/:hello=>/)
      end
    end
    describe "POST /statuses" do
      it "returns a status by id" do
        post "/statuses", {text: "ACK"}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to eq("recived: ACK")
      end
    end
  end
end
