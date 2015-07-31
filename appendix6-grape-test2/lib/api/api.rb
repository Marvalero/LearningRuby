require 'grape'
require_relative 'user'
require_relative 'bd'
class API < Grape::API
  version 'v1', using: :path

  helpers do
    def users
      @users ||= Bd
    end
  end

  resource :users do
    get '/',rabl: 'user' do
      users.collect{|user| user.to_s}
    end

    params do
      requires :id,type: Integer
    end
    get '/:id', rabl: 'user' do
      # @users ||= [User.new("Pepe","Blanco",1)]
      users.select{|user| user.id }.to_s
    end

    post '/' do
      users << User.new(params[:name],params[:surname],params[:id])
    end

    params do
      requires :id, type: Integer
      optional :text, type: String, regexp: /show_users/
    end
    delete '/:id' do
      users.select{|user| user.id == params[:id].to_i}.each {|user| users.delete(user)}
      if params[:text]
        users.collect{|user| user.to_s}
      else
        "DELETED"
      end
    end
  end

  get :hello do
    { hello: "world" }
  end
  post '/statuses' do
    "recived: #{params[:text]}"
  end
end
