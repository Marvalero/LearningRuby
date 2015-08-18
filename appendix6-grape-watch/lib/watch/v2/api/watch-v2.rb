require 'grape'

module Watch
  module V2
    module API
      class WatchApi < Grape::API
        version 'v2'
        format :json

        helpers do
          def get_watch(topic)
            @@watch ||= {default: {time: Time.now, num_req: 0}}
            @@watch[topic] ? @@watch[topic] : @@watch[:default]
          end
          def set_watch(topic,value,num_req)
            if value.is_a? Time
              @@watch[topic]= {time: value, num_req: num_req}
            else
              raise RuntimeError.new, "Incorrect time"
            end
          end
          def update_num_req(topic,value,num_req)
            if num_req != 0
              num_req = num_req-1
              if num_req == 0
                @@watch.delete(topic)
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
            update_num_req(params["topic"],watch_topic[:time],watch_topic[:num_req])

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

              set_watch(params["topic"],Time.at(req_body["time"]),num_req)
            else
              error!('400 Bad Request', 400)
            end
          end

        end
      end
    end
  end
end
