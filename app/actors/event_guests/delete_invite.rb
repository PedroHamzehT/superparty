# frozen_string_literal: true

module EventGuests
  class DeleteInvite < Actor
    input :invite, type: EventGuest

    play :delete_invite

    private

    def delete_invite
      return if invite.destroy

      fail!(error: invite.friendly_error_messages)
    end
  end
end
