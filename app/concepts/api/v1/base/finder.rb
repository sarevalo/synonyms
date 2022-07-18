module API
  module V1
    module Base
      # Base operation
      class Finder < Trailblazer::Finder
        include Mixins::Finder

        property :id, type: Types::String
        property :created_at, type: Types::String, sortable: true
      end
    end
  end
end
