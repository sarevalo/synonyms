module API
  module V1
    module Backoffice
      # Update operation
      class Word::Operation::Update < API::V1::Base::Operation
        step Rescue(handler: :error!) {
          step Model(::Word, :find_by )
          step Contract::Build( constant: Word::Contract::Update )
          step Contract::Validate()
          step Contract::Persist()
        }
        fail :set_status!
      end
    end
  end
end