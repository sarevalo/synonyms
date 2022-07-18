module API
  module V1
    module Backoffice
      class WordSerializer < API::BaseSerializer
        attributes :id, :reference, :status

        has_many :synonyms, serializer: API::V1::Shared::SynonymSerializer
      end
    end
  end
end
