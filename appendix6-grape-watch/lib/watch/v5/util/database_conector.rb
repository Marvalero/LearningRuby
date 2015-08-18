require 'ostruct'

module Util
  module V5
    class DbConector
      public
      def update_database(topic,time,num_req)
        if watches.filter(topic: topic).first
          watches.where(topic: topic).update(time: time, num_req: num_req)
        else
          watches.insert(topic: topic, time: time, num_req: num_req)
        end
      end
      def query(topic)
        response = watches.filter(topic: topic).first
        response.delete(:untitled) and OpenStruct.new(response) if response
      end
      def delete(topic)
        watches.filter(topic: topic).delete
      end

      private
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
