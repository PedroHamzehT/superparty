# frozen_string_literal: true

module Api
  module V1
    class ContributionsController < ApplicationController
      include FindObjects

      before_action :authenticate_user!
      before_action :find_event

      def index
        authorize(@event)

        @contribution = @event.contribution
        render json: {}, status: :no_content unless @contribution
      end

      def create
        authorize(@event)

        result = Generic::CreateRecord.result(
          klass: Contribution,
          params: contribution_params.merge(event_id: @event.id)
        )
        return error_response if result.failure?

        @contribution = result.record
      end

      def update
        authorize(@event)

        result = Generic::UpdateRecord.result(record: @event.contribution, params: contribution_params)
        return error_response if result.failure?

        @contribution = result.record
      end

      def destroy
        authorize(@event)

        result = Generic::DestroyRecord.result(record: @event.contribution)
        return error_response if result.failure?
      end

      private

      def contribution_params
        params.require(:contribution).permit(
          :start_date, :end_date, :auto_create_suggestions, :show_who_contributed, :suggestions_allowed
        )
      end
    end
  end
end
