# frozen_string_literal: true

module Sessions
  class CreateOneTimePassword < Actor
    input :email, type: String

    play :find_or_create_user,
         :generate_one_time_password,
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
        passwordless_creation: true
      )
    end

    def generate_one_time_password
      return if @user.update(
        one_time_password: Random.rand(10_000..99_999),
        one_time_password_confirmed_at: nil,
        passwordless_creation: true
      )

      fail!(error: @user.friendly_error_messages)
    end

    def notify_user
      UserMailer.with(user: @user).one_time_password_email.deliver_now
    end
  end
end
