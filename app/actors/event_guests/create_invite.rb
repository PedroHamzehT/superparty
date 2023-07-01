# frozen_string_literal: true

module EventGuests
  class CreateInvite < Actor
    input :email, type: String, default: nil
    input :event_id, type: [String, Integer], default: nil
    input :user, type: User

    output :invite

    play :find_event,
         :create_invite,
         :notify_guest

    private

    def find_event
      @event = Event.find_by(id: event_id)
      fail!(error: 'Event not found') unless @event
    end

    def create_invite
      fail!(error: "User can't create invite for this event") if @event.user_id != user.id

      @invite = @event.invites.new(email:, confirmation_token: SecureRandom.urlsafe_base64)
      fail!(error: @invite.friendly_error_messages) unless @invite.save

      self.invite = @invite
    end

    def notify_guest
      EventGuestMailer.with(invite: @invite).send_invite_email.deliver_now
    end
  end
end
