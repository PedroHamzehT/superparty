# frozen_string_literal: true

class ApplicationController < ActionController::API
  def error_response(result: @result, status: :bad_request)
    render json: { success: false, error: result.error }, status:
  end

  def object_not_found_error(object)
    render json: { success: false, error: "#{object} not found " }, status: :bad_request
  end
end
