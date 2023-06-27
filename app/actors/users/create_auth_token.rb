# frozen_string_literal: true

module Users
  class CreateAuthToken < Actor
    input :email, type: String

    play :find_or_create_user,
         :generate_auth_token,
         :notify_user

    private

    def find_or_create_user
      @user = User.find_by(email:)
      return if @user.present?

      random_password = SecureRandom.base64(12)
      @user = User.create!(
        email:,
        password: random_password,
        password_confirmation: random_password,
        magic_link_creation: true
      )
    end

    def generate_auth_token
      return if @user.update(
        auth_token: SecureRandom.urlsafe_base64,
        auth_token_confirmed_at: nil,
        magic_link_creation: true
      )

      fail!(error: @user.friendly_error_messages)
    end

    def notify_user
      UserMailer.with(user: @user).magic_link_email.deliver_now
    end
  end
end
