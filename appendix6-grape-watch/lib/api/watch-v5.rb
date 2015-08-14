require 'grape'
require 'sequel'
require_relative '../util/database_v5'

module API
  module V5
    class WatchApi < Grape::API
      version 'v5'
      format :json
      helpers do
        def check_parameters(request)
          require 'json'
          error!('400 Bad Request. Required: num_req(Integer) and time(Integer)',400) unless request.body.length>2
          req_body = JSON.parse(request.body.read)
          error!('400 Bad Request. Required: num_req(Integer) and time(Integer)', 400) unless (req_body["time"].kind_of? Integer and req_body["num_req"].kind_of? Integer)
          {time: req_body["time"], num_req: req_body["num_req"]}
        end
        def database
          @@database  ||= Util::V5::Database.new
        end
      end
      def self.call(env,db=nil)
        @@database= db if db
        super(env)
      end

      resource :watchs do
        params do
          requires :topic, type: String, desc: "Topic of the watch you want to see"
        end
        get '/:topic' do
          database.get_watch(params["topic"]).to_h
        end

        params do
          requires :topic, type: String, desc: "Topic of the watch you want to set"
        end
        put '/:topic' do
          status 204
          req_body = check_parameters(request).merge({topic: params["topic"]})
          database.set_topic(topic: req_body[:topic], time: req_body[:time], num_req: req_body[:num_req])
        end
      end
    end
  end
end
