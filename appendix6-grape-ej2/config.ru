require 'grape'

class API < Grape::API
  get '/files/:id', rabl:'assets/item' do
    @assets = Assets[params[:id]]
  end
end

#class Web < Sinatra::Base
#    get '/' do
#      "Hello world."
#    end
#end

use Rack::Session::Cookie
run Rack::Cascade.new [API] #,Web]
