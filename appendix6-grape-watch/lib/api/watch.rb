require 'grape'
require_relative '../app/watch'

class WatchApi < Grape::API
  helpers do
    def get_watch
      @@watch ||= Watch.new
    end
    def set_watch(watch)
      @@watch.set(watch)
    end
  end

  resource :watch do
    get '/' do
      "{\"time\": \"#{get_watch}\"}"
    end

    params do
      requires :time, type: String, desc: 'New watch value'
    end
    put '/' do
      status 204
      set_watch(params[:time])
    end
  end
end

