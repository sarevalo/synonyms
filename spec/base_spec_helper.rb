module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(response.body))
  end
end
