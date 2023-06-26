# frozen_string_literal: true

module Sessions
  class CreateByMagicLink < Actor
    input :auth_token, type: String

    play :find_user,
         :update_user_token_confirmed_at,
         Tokens::GenerateJwt

    private

    def find_user
      @user = User.find_by(auth_token:)
      fail!(error: 'Invalid token') if @user.blank?
    end

    def update_user_token_confirmed_at
      @user.update!(auth_token_confirmed_at: Time.zone.now)
    end
  end
end
