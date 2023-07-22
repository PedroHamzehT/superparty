# frozen_string_literal: true

module Api
  module V1
    class ContributionItemsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_contribution
      before_action :find_contribution_item, only: %i[update destroy]

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

      def update
        authorize(@event)

        result = Generic::UpdateRecord.result(
          record: @contribution_item,
          params: contribution_item_params.merge(contribution_id: @contribution.id)
        )
        return error_response if result.failure?

        @contribution_item = result.record
      end

      def destroy
        authorize(@event)

        result = Generic::DestroyRecord.result(record: @contribution_item)
        return error_response if result.failure?
      end

      private

      def contribution_item_params
        params.require(:contribution_item).permit(:name, :description, :max_amount_allowed)
      end
    end
  end
end
