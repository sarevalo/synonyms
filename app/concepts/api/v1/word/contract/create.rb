module API
  module V1
    # word contract
    class Word::Contract::Create < Reform::Form
      property :reference

      validates :reference, presence: true

      collection :synonyms, populator: :populate_synonyms do
        property :reference

        validates :reference, presence: true
      end

      def populate_synonyms(options:, **)
        synonyms.append(::Synonym.new)
      end
    end
  end
end
