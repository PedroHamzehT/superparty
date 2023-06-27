# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        @result = Users::SignUpService.call(sign_up_params)
        return error_response unless @result.success
      end

      def create_auth_token
        @result = Users::CreateAuthToken.result(email: params[:user][:email])
        return error_response unless @result.success?
      end

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
