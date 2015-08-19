
module Watch
  module V6
    module Util
      class ActionDb
        public
        def initialize(db=nil)
          @db_conector= db
        end

        def get_watch(topic)
          params = query_watch(topic)
          update_num_req(params)
          params
        end
        def set_topic(topic:,time:, num_req:)
          true if db_conector.update_database( create_watch(topic: topic, time: time, num_req: num_req))
        end
        def db_conector
          @@db_conector ||= Watch::V6::Util::DbConector.new
        end

        private
        include Watch::V6::Util::CreateWatch
        def update_num_req(params)
          params.num_req = params.num_req - 1
          if params.num_req == 0
            db_conector.delete(params.topic)
          elsif params.num_req >0
            db_conector.update_database(params)
          end
        end
        def query_watch(topic)
          default = {topic: topic, time: Time.now.to_i, num_req: 0}
          query = db_conector.query(topic)
          query ? query : create_watch(default)
        end
      end
    end
  end
end
