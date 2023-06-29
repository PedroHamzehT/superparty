# frozen_string_literal: true

module Events
  class CreateEvent < Actor
    input :name, type: String, default: nil
    input :description, type: String, default: nil
    input :date, type: String, default: nil
    input :time, type: String, default: nil
    input :user, type: User

    output :event

    play :create_event

    private

    def create_event
      event = user.events.new(name:, description:, date:, time:)
      fail!(error: event.friendly_error_messages) unless event.save

      self.event = event
    end
  end
end
