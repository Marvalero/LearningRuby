
module Watch
  module V3
    require_relative 'v3/api/watch-v3'
    class Base < Grape::API
      mount Watch::V3::API::WatchApi
    end
  end
end
