# frozen_string_literal: true

module Api
  module V1
    class ContributionSuggestionsController < ApplicationController
      include FindObjects

      before_action :authenticate_user!
      before_action :find_contribution
      before_action :find_contribution_suggestion, only: %i[destroy]

      def index
        authorize(ContributionSuggestion.new(contribution: @contribution))

        @contribution_suggestions = policy_scope(ContributionSuggestion.includes(:user))
      end

      def create
        authorize(ContributionSuggestion.new(contribution: @contribution))

        unless @contribution.suggestions_allowed
          return render json: { error: 'Contribution doesn\'t allow suggestions' }, status: :bad_request
        end

        @contribution.auto_create_suggestions? ? create_contribution_item : create_contribution_suggestion
      end

      def destroy
        authorize(@contribution_suggestion)

        @result = Generic::DestroyRecord.result(record: @contribution_suggestion)
        return error_response if @result.failure?
      end

      private

      def create_contribution_item
        @result = Generic::CreateRecord.result(
          klass: ContributionItem,
          params: contribution_suggestion_params.except(:user_id)
        )
        return error_response if @result.failure?

        @contribution_item = @result.record
        render 'api/v1/contribution_items/create'
      end

      def create_contribution_suggestion
        @result = Generic::CreateRecord.result(
          klass: ContributionSuggestion,
          params: contribution_suggestion_params
        )
        return error_response if @result.failure?

        @contribution_suggestion = @result.record
        render 'api/v1/contribution_suggestions/show'
      end

      def find_contribution_suggestion
        @contribution_suggestion = ContributionSuggestion.find_by(id: params[:id])
        raise ObjectNotFoundError, 'contribution_suggestion' unless @contribution_suggestion
      end

      def contribution_suggestion_params
        params.require(:contribution_suggestion)
              .permit(:name, :description)
              .merge(user_id: current_user.id, contribution_id: @contribution.id)
      end
    end
  end
end
