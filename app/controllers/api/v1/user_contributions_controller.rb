# frozen_string_literal: true

module Api
  module V1
    class UserContributionsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_contribution_item
      before_action :find_user_contribution, only: %i[destroy]

      def create
        potential_new_contribution = UserContribution.new(contribution_item: @contribution_item)
        authorize(potential_new_contribution)

        @result = UserContributions::CreateContribution.result(
          user: current_user,
          contribution_item: @contribution_item
        )
        return error_response if @result.failure?

        @user_contribution = @result.user_contribution
      end

      def destroy
        authorize(@user_contribution)

        @result = Generic::DestroyRecord.result(record: @user_contribution)
        return error_response if @result.failure?
      end

      private

      def find_user_contribution
        @user_contribution = @contribution_item.user_contributions.find_by(id: params[:contribution_item_id])
        raise ObjectNotFoundError, 'user_contribution' unless @user_contribution
      end
    end
  end
end
