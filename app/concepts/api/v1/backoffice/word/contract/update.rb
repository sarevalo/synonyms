module API
  module V1
    module Backoffice
      # word contract
      class Word::Contract::Update < Reform::Form
        property :reference
        property :status

        validates :reference, presence: true
      end
    end
  end
end
