module API
  module V1
    module Backoffice
      # ApplicationController
      class ApplicationController < ::ApplicationController
        before_action :authorize_request
      end
    end
  end
end
