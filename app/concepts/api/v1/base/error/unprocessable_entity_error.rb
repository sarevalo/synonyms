module API
  module V1
    module Base
      # Unprocessable entity error
      class Error::UnprocessableEntityError < Error
        def status
          422
        end
      end
    end
  end
end
