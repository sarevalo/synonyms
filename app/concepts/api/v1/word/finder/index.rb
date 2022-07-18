module API
  module V1
    module Word
      # Finder operation
      class Finder::Index < Trailblazer::Finder
        include Mixins::Finder

        property :id, type: Types::String
        property :reference, type: Types::String
        property :status, type: Types::String
      end
    end
  end
end
