require_relative 'watch-v1'
require_relative 'watch-v2'
require_relative 'watch-v3'

module API
  class Base < Grape::API
    mount API::V1::WatchApi
    mount API::V2::WatchApi
    mount API::V3::WatchApi
  end
end
