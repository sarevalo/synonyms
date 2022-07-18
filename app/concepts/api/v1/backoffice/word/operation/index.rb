module API
  module V1
    module Backoffice
      # Index operation
      class Word::Operation::Index < API::V1::Base::Operation::Index
        self['model.class'] = ::Word
      end
    end
  end
end
