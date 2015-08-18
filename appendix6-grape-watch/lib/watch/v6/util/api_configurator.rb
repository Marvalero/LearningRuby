require_relative 'action_db'

module Watch
  module V6
    module Util
      class ApiConfigurator
        def initialize(app)
          @app = app
        end
        def call(env, opts={})
          self.database=opts[:database]
          @app.call(env,database)
        end
        def database
          @database
        end
        def database=(value)
          @database = value || Watch::V6::Util::ActionDb.new
        end
      end
    end
  end
end
