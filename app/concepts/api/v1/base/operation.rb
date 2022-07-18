module API
  module V1
    module Base
      # Base operation
      class Operation < Trailblazer::Operation
        extend ClassDependencies

        NOT_FOUND_ERRORS = [
          ActiveRecord::RecordNotFound
        ].freeze

        UNPROCESSABLE_ENTITY_ERRORS = [
          ActiveRecord::RecordInvalid
        ].freeze

        def finder!(ctx, params:, **)
          klass = ctx['model.class']

          ctx['finder'] = ctx['finder.class'].new(
            entity: klass,
            params: params.to_unsafe_h
          )
        end

        def model!(ctx, **)
          ctx['model'] = ctx['model.class'].new
        end

        def models!(ctx, **)
          klass = ctx['model.class']

          ctx['model'] =
            if ctx['finder.class']
              ctx['finder'].result
            else
              klass.all
            end
        end

        def set_status!(ctx, **)
          ctx['error_status'] = 422
        end

        def error!(exception, ctx, **)
          klass = exception.class

          ctx['error_status'] =
            if exception.respond_to?(:status)
              exception.status
            elsif NOT_FOUND_ERRORS.include?(klass)
              404
            elsif UNPROCESSABLE_ENTITY_ERRORS.include?(klass)
              422
            else
              500
            end
          ctx['error_code'] = (exception.code if exception.respond_to?(:code))

          ctx['error_message'] =
            exception.message
        end
      end
    end
  end
end
