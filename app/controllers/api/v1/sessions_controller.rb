# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
      end

      def create_by_magic_link
        result = Sessions::CreateByMagicLinkService.call(magic_link_params)
        if result.success
          render json
        else
          render json: { success: false, errors: result.errors }, status: :bad_request
        end
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
