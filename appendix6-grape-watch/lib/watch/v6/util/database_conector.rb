
module Watch
  module V6
    module Util
      class DbConector
        public
        def update_database(watch)
          if watches.filter(topic: watch.topic).first
            watches.where(topic: watch.topic).update(time: watch.time, num_req: watch.num_req)
          else
            watches.insert(topic: watch.topic, time: watch.time, num_req: watch.num_req)
          end
        end
        def query(topic)
          response = watches.filter(topic: topic).first
          response.delete(:untitled) and create_watch(response) if response
        end
        def delete(topic)
          watches.filter(topic: topic).delete
        end

        private
        include Watch::V6::Util::CreateWatch
        def db
          @@db ||= Sequel.sqlite
        end
        def watches
          create_table unless defined? @@watches
          @@watches ||= db[:watches]
        end
        def create_table
          begin
            db.create_table :watches do
              primary_key String :topic
              Integer :time
              Integer :num_req
            end
          rescue SQLException => detail
            detail
          end
        end
      end
    end
  end
end
