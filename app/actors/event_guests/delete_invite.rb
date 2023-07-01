# frozen_string_literal: true

module EventGuests
  class DeleteInvite < Actor
    input :invite, type: EventGuest
    input :user, type: User

    play :delete_invite

    private

    def find_invite
      @invite = EventGuest.find_by(id:)
      fail!(error: 'Invite not found') unless @invite
    end

    def delete_invite
      fail!(error: "User can't delete the invite for this event") if invite.event.user_id != user.id
      return if invite.destroy

      fail!(error: invite.friendly_error_messages)
    end
  end
end
