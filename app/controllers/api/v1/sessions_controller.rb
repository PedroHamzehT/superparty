# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @result = Sessions::SignInService.call(sessionres_create_params)
        return error_response unless @result.success
      end

      def magic_link
        @result = Sessions::CreateByMagicLinkService.call(auth_token: params[:auth_token])
        return error_response unless @result.success
      end

      def destroy
      end

      private

      def sessions_create_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
