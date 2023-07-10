# frozen_string_literal: true

module EventGuests
  class CreateInvite < Actor
    input :email, type: String, default: nil
    input :event, type: Event

    output :invite

    play :create_invite,
         :notify_guest

    private

    def create_invite
      @invite = event.invites.new(email:, confirmation_token: SecureRandom.urlsafe_base64)
      fail!(error: @invite.friendly_error_messages) unless @invite.save

      self.invite = @invite
    end

    def notify_guest
      EventGuestMailer.with(invite: @invite).send_invite_email.deliver_now
    end
  end
end
