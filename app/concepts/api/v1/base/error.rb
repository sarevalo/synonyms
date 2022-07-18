module API
  module V1
    module Base
      # Base error
      class Error < StandardError
        attr_reader :errors

        def initialize(message = '', errors = {})
          @errors = errors

          super(message)
        end

        def status
          500
        end
      end
    end
  end
end