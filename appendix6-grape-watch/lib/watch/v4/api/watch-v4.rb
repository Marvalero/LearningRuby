require 'grape'
require 'sequel'
require_relative '../../../watch'

module Watch
  module V4
    module API
      class WatchApi < Grape::API
        version 'v4'
        format :json

        helpers do
          def check_parameters(request)
            require 'json'
            error!('400 Bad Request',400) unless request.body.length>2
            req_body = JSON.parse(request.body.read)
            error!('400 Bad Request', 400) unless (req_body["time"].kind_of? Integer and req_body["num_req"].kind_of? Integer)
            {time: req_body["time"], num_req: req_body["num_req"]}
          end
          def database
            @@database  ||= Watch::V4::Util::Database.new
          end
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
end
