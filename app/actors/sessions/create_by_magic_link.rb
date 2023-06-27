# frozen_string_literal: true

module Sessions
  class CreateByMagicLink < Actor
    input :auth_token, type: String

    output :jwt_token

    play :find_user,
         :update_user_token_confirmed_at,
         :generate_jwt_token

    private

    def find_user
      @user = User.find_by(auth_token:)
      fail!(error: 'Invalid token') if @user.blank? || @user.auth_token_confirmed_at?
    end

    def update_user_token_confirmed_at
      return if @user.update(auth_token_confirmed_at: Time.zone.now, magic_link_creation: true)

      fail!(error: @user.friendly_error_messages)
    end

    def generate_jwt_token
      result = Tokens::GenerateJwt.result(user: @user)
      fail!(error: result.error) unless result.success?

      self.jwt_token = result.jwt_token
    end
  end
end
