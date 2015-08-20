
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
        def set_topic(params)
          watch = create_watch(topic: params[:topic],time: params[:time],num_req: params[:num_req])
          true if db_conector.update_database(watch)
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
          query = db_conector.query(topic)
          query ? query : default_watch(topic)
        end
        def default_watch(topic)
          create_watch( {topic: topic, time: Time.now.to_i, num_req: 0}) 
        end
      end
    end
  end
end
