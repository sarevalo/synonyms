module API
  module V1
    module Backoffice
      # Update operation
      class Word::Operation::Destroy < API::V1::Base::Operation
        step Rescue(handler: :error!) {
          step Model(::Word, :find_by)
          step :delete!
        }
        fail :set_status!

        def delete!(_ctx, model:, **)
          model.destroy!
        end
      end
    end
  end
end
