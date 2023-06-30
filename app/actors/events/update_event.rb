# frozen_string_literal: true

module Events
  class UpdateEvent < Actor
    input :event, type: Event
    input :name, type: String, default: nil
    input :description, type: String, default: nil
    input :date, type: String, default: nil
    input :time, type: String, default: nil

    play :update_event

    private

    def update_event
      return if event.update(name:, description:, date:, time:)

      fail!(error: event.friendly_error_messages)
    end
  end
end
