# frozen_string_literal: true

module Api
  module V1
    class ContributionsController < ApplicationController
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

      def find_event
        @event = policy_scope(Event).find_by(id: params[:event_id])
        return object_not_found_error(:event) unless @event
      end

      def contribution_params
        params.require(:contribution).permit(:start_date, :end_date)
      end
    end
  end
end
