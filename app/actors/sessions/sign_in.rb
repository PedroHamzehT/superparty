# frozen_string_literal: true

module Sessions
  class SignIn < Actor
    input :email, type: String
    input :password, type: String

    output :jwt_token

    play :find_and_authenticate_user,
         :generate_jwt_token

    private

    def find_and_authenticate_user
      @user = User.find_by(email:)
      fail!(error: 'Invalid e-mail or password') if @user.blank? || !@user.authenticate(password)
    end

    def generate_jwt_token
      result = Tokens::GenerateJwt.result(user: @user)
      fail!(error: result.error) unless result.success?

      self.jwt_token = result.jwt_token
    end
  end
end
