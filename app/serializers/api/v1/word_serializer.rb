module API
  module V1
    class WordSerializer < API::BaseSerializer
      attributes :id, :reference

      has_many :synonyms, serializer: API::V1::Shared::SynonymSerializer
    end
  end
end
