require_relative 'database_conector'
require 'ostruct'

module Util
  module V5
    class ActionDb
      public
      def get_watch(topic)
        params = query_watch(topic)
        update_num_req(params)
        params
      end
      def set_topic(topic: nil,time: nil, num_req: nil)
        true if db_conector.update_database(topic, time, num_req)
      end

      private
      def update_num_req(params)
        params[:num_req] = params[:num_req] - 1
        if params[:num_req] == 0
          db_conector.delete(params[:topic])
        elsif params[:num_req] >0
          db_conector.update_database(params[:topic],params[:time], params[:num_req])
        end
      end
      def query_watch(topic)
        default = {topic: topic, time: Time.now.to_i, num_req: 0}
        query = db_conector.query(topic)
        query ? query : OpenStruct.new(default)
      end
      def db_conector
        @@db_conector ||= Util::V5::DbConector.new
      end
    end
  end
end
