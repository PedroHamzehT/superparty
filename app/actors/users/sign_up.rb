# frozen_string_literal: true

module Users
  class SignUp < Actor
    input :email, type: String
    input :password, type: String
    input :password_confirmation, type: String
    input :first_name, type: String
    input :last_name, type: String

    output :jwt_token

    play :register_user,
         :generate_jwt_token

    private

    def register_user
      @user = User.new(first_name:, last_name:, email:, password:, password_confirmation:)
      fail!(error: @user.friendly_error_messages) unless @user.save
    end

    def generate_jwt_token
      result = Tokens::GenerateJwt.result(user: @user)
      fail!(error: result.error) unless result.success?

      self.jwt_token = result.jwt_token
    end
  end
end
