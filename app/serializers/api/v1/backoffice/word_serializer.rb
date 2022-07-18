module API
  module V1
    module Backoffice
      class WordSerializer < API::BaseSerializer
        attributes :id, :reference, :status
      end
    end
  end
end
