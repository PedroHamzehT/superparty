# frozen_string_literal: true

module Api
  module V1
    class EventGuestsController < ApplicationController
      before_action :authenticate_user!, except: %i[confirm]
      before_action :find_current_user, only: %i[confirm]
      before_action :find_invite, only: %i[]

      def index
        result = EventGuests::ListInvites.result(event_id: params[:event_id])
        return error_response(result:) if result.failure?

        @invites = result.invites
      end

      def create
        return unless can_modify_invite?('create')

        result = EventGuests::CreateInvite.result(invitation_params.merge(user: @current_user))
        return error_response(result:) if result.failure?

        @invite = result.invite
      end

      def destroy
        result = EventGuests::DeleteInvite.result(id: params[:id], user: @current_user)
        return error_response(result:) if result.failure?
      end

      def confirm
        result = EventGuests::ConfirmInvite.result(confirm_invite_params.merge(user: @current_user))
        return error_response(result:) if result.failure?
      end

      private

      def can_modify_invite?(action)
        result = EventGuests::CanModifyInvite.result(current_user: @current_user, event: @event, action:)
        error_response(result:, status: :unauthorized) if result.failure?

        result.success?
      end

      def find_current_user
        result = Tokens::IdentifyUser.result(header_authorization: request.headers['Authorization'])
        @current_user = result.user if result.success?
      end

      def invitation_params
        params.permit(:event_id, :email)
      end

      def confirm_invite_params
        params.permit(:id, :confirmation_token)
      end
    end
  end
end
