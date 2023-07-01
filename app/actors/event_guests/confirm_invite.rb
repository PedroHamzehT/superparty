# frozen_string_literal: true

module EventGuests
  class ConfirmInvite < Actor
    input :id, type: [String, Integer], default: nil
    input :confirmation_token, type: String
    input :user, type: User, allow_nil: true

    play :confirm_by_organizer,
         :confirm_by_guest

    private

    def confirm_by_organizer
      invite = EventGuest.find_by(id:)
      return if invite.blank? || invite.event.user_id != user.id

      fail!(error: invite.friendly_error_messages) unless invite.update(confirmed_at: Time.zone.now)
      @confirmed_by_organizer = true
    end

    def confirm_by_guest
      return if @confirmed_by_organizer

      invite = EventGuest.find_by(confirmation_token:)
      fail!(error: 'Invite not found') unless invite
      fail!(error: 'Invited already confirmed') if invite.confirmed_at?
      fail!(error: invite.friendly_error_messages) unless invite.update(confirmed_at: Time.zone.now)
    end
  end
end
