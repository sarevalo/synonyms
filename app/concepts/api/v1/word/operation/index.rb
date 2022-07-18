module API
  module V1
    # Index operation
    class Word::Operation::Index < API::V1::Base::Operation::Index
      self['finder.class'] = Word::Finder::Index

      def finder!(ctx, params:, **)
        ctx[:finder] = ctx['finder.class'].new(
          entity: ::Word.approved,
          params: params.to_unsafe_h
        )
      end
    end
  end
end
