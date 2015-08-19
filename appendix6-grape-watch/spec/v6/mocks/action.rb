
module Mocks
  module V6
    class ActionMock
      def initialize(action=nil)
        @action= action
      end
      def set_topic(args)
        true
      end
      def get_watch(args)
        watch
      end
      def time=(value)
        @@time = value
      end
      def time
        @@time ||= Time.now.to_i
      end
      def action
        @action
      end
      def watch
        @@watch ||= Struct.new(:time).new(time)
        @@watch.time= time
        @@watch
      end

    end
  end
end
