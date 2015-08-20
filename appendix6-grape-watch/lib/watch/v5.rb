
module Watch
  module V5
    require_relative 'v5/api/watch-v5'
    require_relative 'v5/util/action_db'
    require_relative 'v5/util/api_configurator'
    require_relative 'v5/util/database_conector'
    class Base < Grape::API
      mount Watch::V5::API::WatchApi
    end
  end
end
