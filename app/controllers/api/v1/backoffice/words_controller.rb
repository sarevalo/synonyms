module API
  module V1
    module Backoffice
      # Words controller
      class WordsController < ApplicationController
        def index
          operation = Word::Operation::Index.call(params: params)
          response_operation(operation)
        end

        def update
          operation = Word::Operation::Update.call(params: params)
          response_operation(operation, status: 204)
        end

        def destroy
          operation = Word::Operation::Destroy.call(params: params)
          response_operation(operation, status: 204)
        end
      end
    end
  end
end
