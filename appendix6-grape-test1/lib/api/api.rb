require 'grape'

class API < Grape::API
  get :hello do
    { hello: "world" }
  end
  post '/statuses' do
    puts params[:text]
    "recived: #{params[:text]}"
  end
end
