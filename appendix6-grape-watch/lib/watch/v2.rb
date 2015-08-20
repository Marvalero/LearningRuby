
module Watch
  module V2
    require_relative 'v2/api/watch-v2'
    class Base < Grape::API
      mount Watch::V2::API::WatchApi
    end
  end
end
