class GraphqlController < ApplicationController
  before_action :verify_access_token
  before_action :authorize_request, unless: :is_introspection?

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user
    }
    result = ForkifyBackendSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end

  def authorize_request
    auth_token = AuthorizationService.new(request.headers).authenticate_request!
    @current_user = User.find(auth_token[0]['https://hasura.io/jwt/claims']['x-hasura-user-id'])
  rescue  JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def current_user
    @current_user
  end

  def is_introspection?
    params[:operationName] == 'IntrospectionQuery'
  end

  def verify_access_token
    return if request.headers['Access-Key'] == ENV['ACCESS_KEY']

    render json: { errors: ['Invalid Access Token'] }, status: :unauthorized
  end
end
