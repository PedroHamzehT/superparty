# frozen_string_literal: true

module Tokens
  class GenerateJwtService < BaseService
    attr_reader :jwt_token

    HMAC_SECRET = ENV['JWT_HMAC_SECRET']
    ALGORITHM = 'HS256'

    def call(user:)
      @jwt_token = JWT.encode payload(user), HMAC_SECRET, ALGORITHM
    end

    private

    def payload(user)
      {
        id: user.id,
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name
      }
    end
  end
end
