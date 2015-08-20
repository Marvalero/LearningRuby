
module Watch
  module V1
    require_relative 'v1/api/watch-v1'
    class Base < Grape::API
      mount Watch::V1::API::WatchApi
    end
  end
end
