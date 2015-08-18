
module Util
  module V4
    class Database
      public
      def get_watch(topic)
        params = query_watch(topic)
        update_num_req(params)
        params
      end
      def set_topic(topic: nil,time: nil, num_req: nil)
        true if update_database(topic, time, num_req)
      end

      private
      def update_num_req(params)
        params[:num_req] = params[:num_req] - 1
        if params[:num_req] == 0
          watches.filter(topic: params[:topic]).delete
        elsif params[:num_req] >0
          update_database(params[:topic],params[:time], params[:num_req])
        end
      end
      def update_database(topic,time,num_req)
        if watches.filter(topic: topic).first
          watches.where(topic: topic).update(time: time, num_req: num_req)
        else
          watches.insert(topic: topic, time: time, num_req: num_req)
        end
      end
      def query_watch(topic)
        default = {topic: nil, time: Time.now.to_i, num_req: 0}
        query = watches.filter(:topic => topic).first
        query ? {topic: query[:topic], time: query[:time],num_req: query[:num_req] } : default
      end

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
