# frozen_string_literal: true

module Api
  module V1
    class ContributionItemsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_contribution

      def index
        @contribution_items = @contribution.contribution_items
      end

      def create
        authorize(@event)

        result = Generic::CreateRecord.result(
          klass: ContributionItem,
          params: contribution_item_params.merge(contribution_id: @contribution.id)
        )
        return error_response if result.failure?

        @contribution_item = result.record
      end

      private

      def find_contribution
        @event = policy_scope(Event).find_by(id: params[:event_id])
        return object_not_found_error(:event) unless @event

        @contribution = @event.contribution
        return object_not_found_error(:contribution) unless @contribution
      end

      def contribution_item_params
        params.require(:contribution_item).permit(:name, :description, :max_amount_allowed)
      end
    end
  end
end
