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
    get '/' do #,rabl: 'user' do
      users.collect{|user| user.to_s}
    end

    params do
      requires :id,type: Integer
    end
    get '/:id' do #, rabl: 'user' do
      # @users ||= [User.new("Pepe","Blanco",1)]
      users.select{|user| user.id.to_i == params[:id] }.last.to_s #== params[:id].to_i }.to_s
    end

    post '/' do
      users << User.new(params[:name],params[:surname],params[:id])
    end

    params do
      requires :id, type: Integer #, default: -> { Random.rand(1..100) }
      optional :text, type: String, regexp: /show_users/ #, default: 'blue', values: ['red', 'blue', 'green'] , allow_blank: false
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

  desc "Returns world" do
    detail 'more details'
    #params  API::Entities::Status.documentation
    #success API::Entities::Entity
    failure [[401, 'Unauthorized', "Entities::Error"]]
    named 'My named route'
    headers [XAuthToken: {
      description: 'Valdates your identity',
      required: true
    },
    XOptionalHeader: {
      description: 'Not really needed',
      required: false
    }
    ]
  end
  get :hello do
    { hello: "world" }
  end

  post '/statuses' do
    "recived: #{params[:text]}"
  end
end
