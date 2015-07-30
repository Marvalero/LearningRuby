require_relative "hussars"
require_relative "wings"

module API
  module V1
    class Base < Grape::API
      mount API::V2::Hussars
      mount API::V2::Wings
    end
  end
end
