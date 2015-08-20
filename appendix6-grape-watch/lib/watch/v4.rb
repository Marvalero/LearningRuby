
module Watch
  module V4
    require_relative 'v4/api/watch-v4'
    require_relative 'v4/util/database'
    class Base < Grape::API
      mount Watch::V4::API::WatchApi
    end
  end
end
