module API
  module V1
    class WordSerializer < API::BaseSerializer
      attributes :id, :reference
    end
  end
end
