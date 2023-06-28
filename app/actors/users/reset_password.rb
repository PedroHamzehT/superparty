# frozen_string_literal: true

module Users
  class ResetPassword < Actor
    input :token, type: String
    input :password, type: String
    input :password_confirmation, type: String

    play :find_user_and_validate_token,
         :update_password

    private

    def find_user_and_validate_token
      @user = User.find_by(reset_password_token: token)
      fail!(error: 'Invalid token') if @user.blank? || @user.reset_password_token_confirmed_at?
    end

    def update_password
      return if @user.update(password:, password_confirmation:, reset_password_token_confirmed_at: Time.zone.now)

      fail!(error: @user.friendly_error_messages)
    end
  end
end
