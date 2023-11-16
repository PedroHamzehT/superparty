# frozen_string_literal: true

module Api
  module V1
    class EventGuestsController < ApplicationController
      include FindObjects

      before_action :authenticate_user!, except: %i[confirm]
      before_action :find_current_user, only: %i[confirm]
      before_action :find_event, only: %i[index create]
      before_action :find_invite, only: %i[destroy]

      def index
        authorize @event

        @invites = @event.invites
      end

      def create
        authorize @event, :send_invite?

        result = EventGuests::CreateInvite.result(email: params[:email], event: @event, user: current_user)
        return error_response(result:) if result.failure?

        @invite = result.invite
      end

      def destroy
        authorize @invite

        result = EventGuests::DeleteInvite.result(invite: @invite, user: current_user)
        return error_response(result:) if result.failure?
      end

      def confirm
        result = EventGuests::ConfirmInvite.result(confirm_invite_params.merge(user: current_user))
        return error_response(result:) if result.failure?
      end

      private

      def find_invite
        @invite = EventGuest.find_by(id: params[:id])
        raise ObjectNotFoundError, 'invite' unless @invite
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
