require 'grape'

module API
  module V1
    class WatchApi < Grape::API
      version 'v1'
      format :json

      helpers do
        def get_watch
          @@watch ||= Time.now
        end
        def set_watch(value)
          if value.is_a? Time
            @@watch=value
          else
            raise RuntimeError.new, "Incorrect time"
          end
        end
        def get_time(params)
          year = params["year"] ? params["year"] : Time.now.year
          month = params["month"] ? params["month"] : Time.now.month
          day = params["day"] ? params["day"] : Time.now.day
          hour = params["hour"] ? params["hour"] : Time.now.hour
          min = params["min"] ? params["min"] : Time.now.min
          sec = params["sec"] ? params["sec"] : Time.now.sec
          Time.new(year,month,day,hour,min,sec)
        end
      end

      resource :watch do

        get '/' do
          answer = {time: get_watch}
          @@num_req ||= 0
          if @@num_req != 0
            @@num_req = @@num_req-1
            if @@num_req == 0
              set_watch(Time.now)
            end
          end
          answer
        end

        put '/' do
          require 'json'
          status 204
          if request.body.length>2
            req_body = JSON.parse(request.body.read)
            error!('400 Bad Request', 400) unless req_body["time"]
            set_watch(Time.at(req_body["time"]))
            @@num_req = (req_body["num_req"]) ? req_body["num_req"] : 1
          else
            error!('400 Bad Request', 400)
          end
        end
      end
    end
  end
end
