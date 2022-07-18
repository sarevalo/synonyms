module API
  module V1
    module Shared
      class SynonymSerializer < API::BaseSerializer
        attributes :id, :reference
      end
    end
  end
end
