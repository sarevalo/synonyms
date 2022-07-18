# Application controller
class ApplicationController < ActionController::API
  # rubocop:disable Lint/DuplicateBranch
  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
  # rubocop:enable Lint/DuplicateBranch

  def response_operation(operation = nil, *args)
    return nil unless operation

    options = args.extract_options!
    options[:root] = 'data'

    if operation.success?
      if options[:status] == 204
        render status: :no_content
      elsif operation[:model].respond_to?(:each)
        render_collection(operation, options)
      else
        render_single(operation, options)
      end
    else
      render_error(operation)
    end
  end

  def render_single(operation, options)
    if options[:serializer].present?
      render(json: operation[:model], status: options[:status],
             serializer: options[:serializer], root: options[:root])
    else
      render(json: operation[:model], status: options[:status], root: options[:root])
    end
  end

  def render_collection(operation, options)
    collection = operation[:model]

    if options[:serializer].present?
      render(json: collection, status: options[:status],
             each_serializer: options[:serializer],
             root: options[:root], meta: { pagination: pagination_metadata(operation) })
    else
      render(json: collection, status: options[:status],
             root: options[:root], meta: { pagination: pagination_metadata(operation) })
    end
  end

  def pagination_metadata(operation)
    operation[:finder]&.paging
  end

  def render_error(operation)
    e = {}.tap do |error|
      error[:error] = operation_error(operation)
      error[:code] = operation['error_code']
      error[:status] = operation['error_status']
    end

    render json: e, status: operation['error_status']
  end

  def operation_error(operation = nil)
    return nil unless operation

    if contract_error?(operation)
      operation['contract.default'].errors.messages
    elsif model_error?(operation)
      operation['model'].errors.messages
    elsif custom_error?(operation)
      operation['error_message']
    end
  end

  def contract_error?(operation)
    operation['contract.default'].present? &&
      operation['contract.default'].respond_to?(:errors) &&
      operation['contract.default'].errors.present?
  end

  def model_error?(operation)
    operation['model'].present? &&
      operation['model'].respond_to?(:errors) &&
      operation['model'].errors.present?
  end

  def custom_error?(operation)
    operation['error_message'].present?
  end

  def route_not_found
    render 'error_pages/404', status: :not_found
  end
end
