# frozen_string_literal: true

class ApplicationController < ActionController::API
  attr_reader :current_user

  def error_response(result: @result, status: :bad_request)
    render json: { error: result.error }, status:
  end

  def object_not_found_error(object)
    render json: { error: "#{object} not found" }, status: :bad_request
  end

  def authenticate_user!
    result = Tokens::IdentifyUser.result(header_authorization: request.headers['Authorization'])
    if result.failure?
      render json: { error: result.error }, status: :unauthorized
      return
    end

    @current_user = result.user
  end
end
