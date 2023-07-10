# frozen_string_literal: true

module Events
  class DeleteEvent < Actor
    input :event, type: Event

    play :delete_event

    private

    def delete_event
      return if event.destroy

      fail!(error: event.friendly_error_messages)
    rescue PG::ForeignKeyViolation
      fail!(error: "Can't delete event, it already has guests")
    end
  end
end
