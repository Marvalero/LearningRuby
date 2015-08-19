require 'ostruct'

module Watch
  module V6
    module Util
      module CreateWatch
        def create_watch(topic:, time:, num_req:)
          OpenStruct.new(topic: topic,time: time,num_req: num_req)
        end
      end
    end
  end
end
