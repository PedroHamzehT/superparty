# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      before_action :authenticate_user!

      def create
        result = Events::CreateEvent.result(event_params)
        return error_response(result:) if result.failure?

        @event = result.event
      end

      private

      def event_params
        params.require(:event).permit(:name, :description, :date, :time).merge(user: @current_user)
      end
    end
  end
end
