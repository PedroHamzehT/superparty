# frozen_string_literal: true

module Sessions
  class ConfirmOneTimePassword < Actor
    input :email, type: String
    input :one_time_password, type: Integer

    output :jwt_token, type: String

    play :find_user,
         :confirm_one_time_password,
         :generate_jwt_token

    private

    def find_user
      @user = User.find_by(email:)
      fail!(error: 'User not found') if @user.blank?
    end

    def confirm_one_time_password
      fail!(error: 'Invalid one time password') if one_time_password != @user.one_time_password
      fail!(error: 'One time password expired') if @user.one_time_password_created_at < 5.minutes.ago
      fail!(error: 'One time password already used') if @user.one_time_password_confirmed_at?

      return if @user.update(one_time_password_confirmed_at: Time.current, passwordless_creation: true)

      fail!(error: @user.friendly_error_messages)
    end

    def generate_jwt_token
      result = Tokens::GenerateJwt.result(user: @user)
      fail!(error: result.error) unless result.success?

      self.jwt_token = result.jwt_token
    end
  end
end
