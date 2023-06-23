# frozen_string_literal: true

module Sessions
  class SignInService < BaseService
    attr_reader :jwt_token

    def call(email:, password:)
      user = User.find_by(email:)
      add_error('Invalid e-mail or password') and return if user.blank? || !user.authenticate(password)

      @jwt_token = Tokens::GenerateJwtService.call(user:).jwt_token
    end
  end
end
