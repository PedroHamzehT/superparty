# frozen_string_literal: true

module EventGuests
  class ListInvites < Actor
    input :event_id, type: [String, Integer]

    output :invites

    play :fetch_invites

    private

    def fetch_invites
      self.invites = EventGuest.where(event_id:)
    end
  end
end
