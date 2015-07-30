require_relative "hussars"
require_relative "wings"

module API
  module V1
    class Base < Grape::API
      mount API::V1::Hussars
      mount API::V1::Wings
    end
  end
end
