module API
  module V1
    # word contract
    class Word::Contract::Create < Reform::Form
      property :reference

      validates :reference, presence: true
    end
  end
end
