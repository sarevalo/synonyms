module API
  module V1
    module Base
      # Base operation
      class Operation::Index < Operation
        self['finder.class'] = Finder

        step Rescue(handler: :error!) {
          step :finder!
          step :models!
        }, id: 'Rescued.default'
      end
    end
  end
end
