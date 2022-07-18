module API
  module V1
    module Backoffice
      # word contract
      class Word::Contract::Update < Reform::Form
        property :id
        property :reference
        property :status

        validates :reference, presence: true

        collection :synonyms, populator: :populate_synonyms do
          property :id
          property :reference

          validates :reference, presence: true
        end

        def populate_synonyms(fragment:, **)
          item = synonyms.find { |synonym| synonym.id == fragment['id'].to_i }

          item || synonyms.append(::Synonym.new)
        end
      end
    end
  end
end
