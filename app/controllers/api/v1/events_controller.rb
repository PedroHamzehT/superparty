# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_event, only: %i[show update destroy]

      def index
        result = Events::ListEvents.result(user: current_user)
        return error_response(result:) if result.failure?

        @events = result.events
      end

      def show; end

      def create
        result = Events::CreateEvent.result(event_params)
        return error_response(result:) if result.failure?

        @event = result.event
      end

      def update
        authorize @event
        result = Events::UpdateEvent.result(update_event_params)
        return error_response(result:) if result.failure?

        @event.reload
      end

      def destroy
        authorize @event
        result = Events::DeleteEvent.result(event: @event)
        return error_response(result:) if result.failure?
      end

      private

      def event_params
        params.require(:event).permit(
          :name, :description, :date, :time, :event_format, :event_link,
          address_attributes: %i[street number neighborhood zipcode complement state city]
        ).merge(user: current_user)
      end

      def update_event_params
        event_params.merge(event: @event)
      end
    end
  end
end
