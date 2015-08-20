
module Watch
  module V6
    require_relative 'v6/api/watch'
    require_relative 'v6/util/create_watch'
    require_relative 'v6/util/action_db'
    require_relative 'v6/util/watch_configurator'
    require_relative 'v6/util/database_conector'
    class Base < Grape::API
      mount Watch::V6::API::WatchApi
    end
  end
end
