# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :find_user_by_email, only: %i[recover_password]
      before_action :authenticate_user!, only: %i[my_item_contributions]

      def create
        @result = Users::SignUp.result(sign_up_params)
        return error_response unless @result.success?
      end

      def create_auth_token
        @result = Users::CreateAuthToken.result(email: params[:user][:email])
        return error_response unless @result.success?
      end

      def recover_password
        @result = Users::RecoverPassword.result(user: @user)
        return error_response unless @result.success?
      end

      def reset_password
        @result = Users::ResetPassword.result(reset_password_params)
        return error_response unless @result.success?
      end

      def my_item_contributions
        @user_contributions = current_user.user_contributions.from_contribution(params[:contribution_id])
        render json: { contribution_item_ids: @user_contributions.pluck(:contribution_item_id) }
      end

      private

      def find_user_by_email
        @user = User.find_by(email: params[:email])
        raise ObjectNotFoundError, 'user' unless @user
      end

      def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end

      def reset_password_params
        params.permit(:token, :password, :password_confirmation)
      end
    end
  end
end
