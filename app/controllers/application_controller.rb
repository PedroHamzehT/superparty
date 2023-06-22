# frozen_string_literal: true

class ApplicationController < ActionController::API
  def error_response(result: @result, status: :bad_request)
    render json: { success: false, errors: result.errors }, status:
  end
end
