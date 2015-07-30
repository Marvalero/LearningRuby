require 'grape'

module API
  module V2
    class Hussars < Grape::API
      version 'v2' # path-based versioning by default
      format :json # We don't like xml anymore

      resource :hussars do
        desc "Return list of hussars - v2"
        get do
          Hussar.all # obviously you never want to call #all here
        end
      end
    end
  end
end
