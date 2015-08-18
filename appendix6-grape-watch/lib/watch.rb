
module Watch
  module V1
    require_relative 'watch/v1/api/watch-v1'
    class Base < Grape::API
      mount API::V1::WatchApi
    end
  end
  module V2
    require_relative 'watch/v2/api/watch-v2'
    class Base < Grape::API
      mount API::V2::WatchApi
    end
  end
  module V3
    require_relative 'watch/v3/api/watch-v3'
    class Base < Grape::API
      mount API::V3::WatchApi
    end
  end
  module V4
    require_relative 'watch/v4/api/watch-v4'
    require_relative 'watch/v4/util/database'
    class Base < Grape::API
      mount API::V4::WatchApi
    end
  end
  module V5
    require_relative 'watch/v5/api/watch-v5'
    require_relative 'watch/v5/util/action_db'
    require_relative 'watch/v5/util/api_configurator'
    require_relative 'watch/v5/util/database_conector'
    class Base < Grape::API
      mount API::V5::WatchApi
    end
  end
end
