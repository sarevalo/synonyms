module Mixins
  # Finder initialize settings
  module Finder
    DEFAULT_PER_PAGE = 25
    MIN_PER_PAGE = 1
    MAX_PER_PAGE = 100

    def initialize(options = {})
      base_config(options)

      super
    end

    def base_config(_options = {})
      self.class.config.merge!(
        adapter: :ActiveRecord,
        paging: configuration
      )
    end

    def configuration
      {
        per_page: DEFAULT_PER_PAGE,
        min_per_page: MIN_PER_PAGE,
        max_per_page: MAX_PER_PAGE
      }
    end
  end
end
