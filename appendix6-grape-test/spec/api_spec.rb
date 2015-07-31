require 'spec_helper'

describe API do
  include Rack::Test::Methods

  def app
    API
  end

  describe "v1" do
    describe "GET /hello" do
      it "returns world" do
        get "/v1/hello"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to match(/:hello=>/)
      end
    end
    describe "GET /users" do
      it "returns user Pepe" do
        require 'api/user'

        post "/v1/users", {name: "Pepe", surname: "Garcia", id:1}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to match(/Pepe.+Garcia/)

        get "/v1/users"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to match(/Name:Pepe/)
      end
    end
    describe "GET /users/:id" do
      it "returns user Pepe" do
        require 'api/user'

        post "/v1/users", {name: "Pepe", surname: "Garcia", id:1}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to match(/Pepe.+Garcia/)

        get "/v1/users/1"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to match(/Name:Pepe/)
      end
    end
    describe "ERROR - GET /users/:id" do
      it "Error" do
        require 'api/user'
        get "/v1/users/aaa"
        expect(last_response.status).to eq(400)
        expect(last_response.body).to eql("id is invalid")
      end
    end


    describe "POST /users/:id" do
      it "adding user Pepe" do
        require 'api/user'
        post "/v1/users", {name: "Maria", surname: "Sancho", id:3}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to match(/Maria.+Sancho/)
      end
    end

    describe "DELETE /users/:id" do
      it "delete user Pepe" do
        require 'api/user'
        delete "/v1/users/1"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eql("DELETED")
      end
    end
    describe "DELETE /users/:id" do
      it "delete user Pepe and showing users" do
        require 'api/user'
        post "/v1/users", {name: "Pepe", surname: "Garcia", id:1}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to match(/Pepe.+Garcia/)

        post "/v1/users", {name: "Juan", surname: "Garcia", id:2}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to match(/Pepe.+Garcia/)

        delete "/v1/users/1?text=show_users"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to match(/Name:Juan/)
      end
    end

    describe "Full testing /users/" do
      it "delete user Pepe" do
        require 'api/user'

        post "/v1/users", {name: "Maria", surname: "Sancho", id:1}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to match(/Maria.+Sancho/)

        post "/v1/users", {name: "Manuel", surname: "Lopez", id:2}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to match(/Manuel.+Lopez/)

        delete "/v1/users/1?text=show_users"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to match(/Name:Manuel/)
      end
    end

    describe "POST /statuses" do
      it "returns a status by id" do
        post "/v1/statuses", {text: "ACK"}#, { 'CONTENT_TYPE' => 'statuses' }
        expect(last_response.status).to eq(201)
        expect(last_response.body).to eq("recived: ACK")
      end
    end
  end
end
