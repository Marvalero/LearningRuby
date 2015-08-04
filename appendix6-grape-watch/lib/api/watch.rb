require 'grape'

class WatchApi < Grape::API

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
      answer = "{\"time\": \"#{get_watch}\"}"
      @@num_req ||= 0
      if @@num_req != 0
        @@num_req = @@num_req-1
        if @@num_req == 0
          set_watch(Time.now)
        end
      end
      answer
    end

    params do
      optional :year, type: Integer, desc: 'year'
      optional :month, type: Integer, desc: 'month'
      optional :day, type: Integer, desc: 'day'
      optional :hour, type: Integer, desc: 'hour'
      optional :min, type: Integer, desc: 'minutes'
      optional :sec, type: Integer, desc: 'secundes'
      optional :num_req, type:Integer, desc: 'Number of request the server will return that anwser. 0 means always'
    end

    put '/' do
      require 'json'
      begin
        status 204
        set_watch(get_time(params.to_hash))
        @@num_req = (params[:num_req]) ? params[:num_req] : 1
      rescue RuntimeError
        status 400
      end
    end
  end
end

