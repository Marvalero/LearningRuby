require 'grape'
require 'sequel'

module API
  module V3
    class WatchApi < Grape::API
      version 'v3'
      format :json

      helpers do
        def get_watch(topic)
          default = {time: Time.now, num_req: 0}
          unless defined? @@db
            @@db = Sequel.sqlite
            @@db.create_table :watches do
              primary_key String :topic
              Integer :time
              Integer :num_req
            end
            @@watches = @@db[:watches]
          end
          query = @@watches.filter(:topic => topic).first
          query ? {time: Time.at(query[:time]),num_req: query[:num_req] } : default
        end
        def set_watch(topic,value,num_req)
          if Time.at(value).is_a? Time
            if @@watches.filter(topic: topic).first
              @@watches.where(topic: topic).update(time: value, num_req: num_req)
            else
              @@watches.insert(topic: topic, time: value, num_req: num_req)
            end
          else
            raise RuntimeError.new, "Incorrect time"
          end
        end
        def update_num_req(topic,value,num_req)
          if num_req != 0
            num_req = num_req-1
            if num_req == 0
              @@watches.filter(topic: topic).delete
            else
              set_watch(topic,value,num_req)
            end
          end
        end
      end

      resource :watchs do

        params do
          requires :topic, type: String, desc: "Topic of the watch you want to see"
        end
        get '/:topic' do
          watch_topic = get_watch(params["topic"])
          update_num_req(params["topic"],watch_topic[:time].to_i,watch_topic[:num_req])

          {time: watch_topic[:time]}
        end

        params do
          requires :topic, type: String, desc: "Topic of the watch you want to see"
        end
        put '/:topic' do
          require 'json'
          status 204
          if request.body.length>2
            req_body = JSON.parse(request.body.read)
            error!('400 Bad Request', 400) unless req_body["time"]
            num_req = (req_body["num_req"]) ? req_body["num_req"] : 1

            set_watch(params["topic"],req_body["time"],num_req)
          else
            error!('400 Bad Request', 400)
          end
        end

      end
    end
  end
end
