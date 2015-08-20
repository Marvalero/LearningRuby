require_relative '../../v6'

module Watch
  module V6
    module Util
      class WatchConfigurator
        public
        def initialize(args={})
          args = default.merge(args)

          configure_database(args[:database])
          configure_action(args[:action])
          configure_api(args[:api])
        end

        def api
          @api
        end
        def action
          @action
        end
        def database
          @database
        end

        private
        def configure_api(api)
          api.action= action
          self.api = api.new
        end
        def configure_action(action)
          self.action= action.new(database)
        end
        def configure_database(database)
          self.database= database.new
        end


        def action=(value)
          @action= value
        end
        def api=(value)
          @api=value
        end
        def database=(value)
          @database = value
        end

        def default
          {api: Watch::V6::API::WatchApi,action: Watch::V6::Util::ActionDb,database: Watch::V6::Util::DbConector}
        end
      end
    end
  end
end
