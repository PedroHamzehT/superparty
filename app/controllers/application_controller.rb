# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  private

  def user_not_authorized
    render json: { error: 'Action not authorized' }, status: :unauthorized
  end

  def find_event
    @event = policy_scope(Event).find_by(id: params[:event_id] || params[:id])
    return object_not_found_error(:event) unless @event
  end

  def find_contribution
    find_event unless @event

    @contribution = @event.contribution
    return object_not_found_error(:contribution) unless @contribution
  end

  def find_contribution_item
    find_contribution unless @contribution

    @contribution_item = @contribution.contribution_items.find_by(id: params[:contribution_item_id] || params[:id])
    return object_not_found_error(:contribution_item) unless @contribution_item
  end
end
