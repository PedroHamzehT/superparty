# frozen_string_literal: true

module Tokens
  class GenerateJwt < Actor
    HMAC_SECRET = ENV['JWT_HMAC_SECRET']
    ALGORITHM = 'HS256'

    input :user, type: User

    output :jwt_token

    play :generate_token

    private

    def generate_token
      self.jwt_token = JWT.encode payload(user), HMAC_SECRET, ALGORITHM
    end

    def payload
      {
        id: user.id,
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name
      }
    end
  end
end
