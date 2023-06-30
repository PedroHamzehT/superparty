# frozen_string_literal: true

module Events
  class CreateEvent < Actor
    input :name, type: String, default: nil
    input :description, type: String, default: nil
    input :date, type: String, default: nil
    input :time, type: String, default: nil
    input :event_format, type: String, default: nil
    input :event_link, type: String, default: nil
    input :address_attributes, default: nil
    input :user, type: User

    output :event

    play :create_event

    private

    def create_event
      event = user.events.new(event_params)
      fail!(error: event.friendly_error_messages) unless event.save

      self.event = event
    end

    def event_params
      params = { name:, description:, date:, time:, event_format:, event_link: }
      params[:address_attributes] = address_attributes unless address_attributes.blank?

      params
    end
  end
end
