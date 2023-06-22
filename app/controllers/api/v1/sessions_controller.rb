# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
      end

      def magic_link
        @result = Sessions::CreateByMagicLinkService.call(auth_token: params[:auth_token])
        return error_response unless @result.success
      end

      def destroy
      end

      private

      def magic_link_params
        params.permit(:auth_token)
      end
    end
  end
end
