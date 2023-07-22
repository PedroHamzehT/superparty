# frozen_string_literal: true

module Api
  module V1
    class UserContributionsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_contribution_item
      before_action :find_user_contribution, only: %i[update destroy]

      def index
        @user_contributions = @contribution_item.user_contributions.includes(:user)
      end

      private

      def find_user_contribution
        @user_contribution = @contribution_item.user_contributions.find_by(id: params[:contribution_item_id])
        return object_not_found_error(:user_contribution) unless @user_contribution
      end
    end
  end
end
