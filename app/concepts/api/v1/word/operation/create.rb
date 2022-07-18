module API
  module V1
    # Create operation
    class Word::Operation::Create < API::V1::Base::Operation
      step Rescue(handler: :error!) {
        step Model(::Word, :new)
        step Contract::Build(constant: Word::Contract::Create)
        step Contract::Validate()
        step Contract::Persist()
      }
      fail :set_status!
    end
  end
end
