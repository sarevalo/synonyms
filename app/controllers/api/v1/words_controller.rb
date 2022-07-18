module API
  module V1
    # Words controller
    class WordsController < ApplicationController
      def index
        operation = Word::Operation::Index.call(params: params)
        response_operation(operation)
      end

      def create
        operation = Word::Operation::Create.call(params: params)
        response_operation(operation, status: 201)
      end

      def update
        operation = Word::Operation::Update.call(params: params)
        response_operation(operation, status: 204)
      end
    end
  end
end
