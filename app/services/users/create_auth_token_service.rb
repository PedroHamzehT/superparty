# frozen_string_literal: true

module Users
  class CreateAuthTokenService < BaseService
    def call(email:)
      user = find_user(email) || create_user(email)
      user.update!(auth_token: SecureRandom.urlsafe_base64, auth_token_confirmed_at: nil)

      UserMailer.with(user:).magic_link_email.deliver_now
    end

    private

    def find_user(email)
      User.find_by(email:)
    end

    def create_user(email)
      random_password = SecureRandom.base64(12)
      User.create!(email:, password: random_password, password_confirmation: random_password, magic_link_creation: true)
    end
  end
end
