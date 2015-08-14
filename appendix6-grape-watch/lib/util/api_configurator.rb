require_relative 'database_v5'

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
        @database = value || Util::V5::Database.new
      end
    end
  end
end
