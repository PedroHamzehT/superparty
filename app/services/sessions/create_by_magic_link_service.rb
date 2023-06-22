# frozen_string_literal: true

module Sessions
  class CreateByMagicLinkService < BaseService
    attr_reader :user, :jwt_token

    def call(auth_token:)
      find_user(auth_token)
      add_error('User not found') and return if user.blank?
      add_error('Token already used') and return if user.user.auth_token_confirmed_at?

      user.update(auth_token_confirmed_at: Time.zone.now)
      @jwt_token = Tokens::CreateJWT.call(user:)
    end

    private

    def find_user
      @user = User.find_by(auth_token:)
    end
  end
end
