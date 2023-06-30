# frozen_string_literal: true

module Events
  class ListEvents < Actor
    input :user, type: User

    output :events

    play :fetch_user_events

    private

    def fetch_user_events
      self.events = user.events + user.participating_events
    end
  end
end
