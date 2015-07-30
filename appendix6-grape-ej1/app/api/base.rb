require_relative "v1/base"
require_relative "v2/base"

module API
  module V1
    class Base < Grape::API
      mount API::V1::Base
      mount API::V2::Base
    end
  end
end
