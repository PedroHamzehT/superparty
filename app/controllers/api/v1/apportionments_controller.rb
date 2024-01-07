# frozen_string_literal: true

module Api
  module V1
    class ApportionmentsController < ApplicationController
      include FindObjects

      before_action :authenticate_user!
      before_action :find_event
      before_action :find_apportionment, only: %i[update destroy]

      def index
        @apportionments = @event.apportionments
      end

      def create
        authorize(@event)

        @result = Generic::CreateRecord.result(
          klass: Apportionment,
          params: apportionment_params.merge(event_id: @event.id)
        )
        return error_response if @result.failure?

        @apportionment = @result.record
        render :show, status: :created
      end

      def update
        authorize(@event)

        @result = Generic::UpdateRecord.result(record: @apportionment, params: apportionment_params)
        return error_response if @result.failure?

        @apportionment = @result.record
        render :show, status: :ok
      end

      def destroy
        authorize(@event)

        @result = Generic::DestroyRecord.result(record: @apportionment)
        return error_response if @result.failure?
      end

      private

      def apportionment_params
        params.require(:apportionment).permit(
          :start_date, :dynamic_goal, :end_date, :goal_in_cents,
          :show_goal_progress, :show_who_contributed, :value_per_participant_in_cents
        )
      end
    end
  end
end
