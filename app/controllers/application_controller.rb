# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ObjectNotFoundError, with: :object_not_found_error

  attr_reader :current_user

  def error_response(result: @result, status: :bad_request)
    render json: { error: result.error }, status:
  end

  def authenticate_user!
    result = Tokens::IdentifyUser.result(header_authorization: request.headers['Authorization'])
    if result.failure?
      render json: { error: result.error }, status: :unauthorized
      return
    end

    @current_user = result.user
  end

  private

  def user_not_authorized
    render json: { error: 'Action not authorized' }, status: :unauthorized
  end

  def object_not_found_error(error)
    render json: { error: "#{error.object} not found" }, status: :bad_request
  end
end
