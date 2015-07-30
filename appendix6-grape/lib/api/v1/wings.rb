require "grape"

module API
  module V1
    class Wings < Grape::API
      version 'v1' # path-based versioning by default
      format :json # We don't like xml anymore

      resource :wings do
        desc "Return list of wings"
        get do
          Wings.all # obviously you never want to call #all here
        end
      end
    end
  end
end
