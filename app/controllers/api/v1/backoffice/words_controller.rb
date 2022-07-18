module API
  module V1
    module Backoffice
      # Words controller
      class WordsController < ApplicationController
        def index
          operation = Word::Operation::Index.call(params: params)
          response_operation(operation)
        end
      end
    end
  end
end
