# frozen_string_literal: true

module Sessions
  class CreateByMagicLinkService < BaseService
    attr_reader :user, :jwt_token

    def call(auth_token:)
      find_user(auth_token)
      add_error('Invalid token, try to log in again') and return if user.blank? || user.auth_token_confirmed_at?

      user.update(auth_token_confirmed_at: Time.zone.now)
      @jwt_token = Tokens::GenerateJwtService.call(user:).jwt_token
    end

    private

    def find_user(auth_token)
      @user = User.find_by(auth_token:)
    end
  end
end
