require_relative 'action_db'

module Util
  module V5
    class ApiConfigurator
      def initialize(app)
        @app = app
      end
      def call(env, opts={})
        up_database(opts[:database])
        # @app.configure(database)
        @app.call(env,database)
      end
      def database
        @database
      end
      def up_database(value)
        @database = value || Util::V5::ActionDb.new
      end
    end
  end
end
