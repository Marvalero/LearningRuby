module API
  module V1
    class Base < Grape::API
      mount API::V1::Hussars
      mount API::V1::Wings
    end
  end
  module V2
    class Base < Grape::API
      mount API::V2::Hussars
      mount API::V2::Wings
    end
  end
end
