# frozen_string_literal: true

module Users
  class RecoverPassword < Actor
    input :user, type: User

    play :generate_recover_password_token,
         :notify_user

    private

    def generate_recover_password_token
      return if user.update(reset_password_token: SecureRandom.urlsafe_base64, reset_password_token_confirmed_at: nil)

      fail!(error: user.friendly_error_messages)
    end

    def notify_user
      UserMailer.with(user:).reset_password_email.deliver_now
    end
  end
end
