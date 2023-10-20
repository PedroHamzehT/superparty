# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @result = Sessions::SignIn.result(sessions_create_params)
        return error_response unless @result.success?
      end

      def create_otp
        @result = Sessions::CreateOneTimePassword.result(email: params[:email])
        return error_response unless @result.success?
      end

      def confirm_otp
        @result = Sessions::ConfirmOneTimePassword.result(
          email: params[:email],
          one_time_password: params[:one_time_password]
        )
        return error_response unless @result.success?
      end

      def destroy; end

      private

      def sessions_create_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
