require 'grape'

class WatchApi < Grape::API

  helpers do
    def get_watch
      #require 'pry' ; binding.pry
      Time.now.to_s.match(/(\d\d:\d\d:\d\d)/)
      @@mutex = Mutex.new
      @@mutex.synchronize { @@watch ||= (run_watch and $1) }
    end
    def set_watch(value)
      if value.match(/\d\d:\d\d:\d\d/)
        @@mutex ||= Mutex.new
        @@th ||= Thread.new{sleep}
        @@mutex.synchronize {   @@watch=value  and @@th.exit and run_watch}
      else
        raise RuntimeError.new, "Incorrect time"
      end
    end
    def run_watch
      @@th = Thread.new do
        while true
          sleep(0.5)
          @@mutex.synchronize do
            @@watch = @@watch.split(":")
            if @@watch[2]=="59"
              @@watch[2]="00"
              if @@watch[1]=="59"
                @@watch[1]="00"
                if @@watch[0] == "23"
                  @@watch[0] = "00"
                else
                  @@watch[0] = (@@watch[0].to_i + 1).to_s
                end
              else
                @@watch[1] = (@@watch[1].to_i+1).to_s
              end
            else
              @@watch[2] = (@@watch[2].to_i + 1).to_s
            end
            @@watch = @@watch.collect{|time| time.length==2 ? time : (time<<"0").reverse }
            @@watch = @@watch.join(":")
          end
        end
      end
    end
  end

  resource :watch do

    get '/' do
      answer = "{\"time\": \"#{get_watch}\"}"
      @@num_req ||= 0
      if @@num_req != 0
        @@num_req = @@num_req-1
        if @@num_req == 0
          Time.now.to_s.match(/(\d\d:\d\d:\d\d)/)
          set_watch($1)
        end
      end
      answer
    end

    params do
      requires :time, type: String, desc: 'New watch value'
      optional :num_req, type:Integer, desc: 'Number of request the server will return that anwser'
    end

    put '/' do
      @@num_req = (params[:num_req]) ? params[:num_req] : 1
      status 204
      begin
        set_watch(params[:time])
      rescue RuntimeError
         status 400
      end
    end
  end

end

