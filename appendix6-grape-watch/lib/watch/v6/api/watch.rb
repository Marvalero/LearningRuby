require 'grape'
require 'sequel'
require_relative '../../v6'

module Watch
  module V6
    module API
      class WatchApi < Grape::API
        class << self
          attr_accessor :action
        end

        format :json
        version :v6
        helpers do
          def check_parameters(request)
            require 'json'
            error!('400 Bad Request. Required: num_req(Integer) and time(Integer)',400) unless request.body.length>2
            req_body = JSON.parse(request.body.read)
            error!('400 Bad Request. Required: num_req(Integer) and time(Integer)', 400) unless (req_body["time"].kind_of? Integer and req_body["num_req"].kind_of? Integer)
            {time: req_body["time"], num_req: req_body["num_req"]}
          end
          def action
            WatchApi.action  ||=  Watch::V5::Util::ActionDb.new
          end
          def action=(value)
            WatchApi.action=value
          end
        end


        resource :watchs do
          params do
            requires :topic, type: String, desc: "Topic of the watch you want to see"
          end
          get '/:topic' do
            action.get_watch(params["topic"]).to_h
          end

          params do
            requires :topic, type: String, desc: "Topic of the watch you want to set"
          end
          put '/:topic' do
            status 204
            req_body = check_parameters(request).merge({topic: params["topic"]})
            action.set_topic(req_body)
          end
        end
      end
    end
  end
end
