# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
      end

      def create_auth_token
        @result = Users::CreateAuthTokenService.call(email: params[:email])
        head @result.success ? :created : :bad_request
      end
    end
  end
end
