# frozen_string_literal: true

module Tokens
  class IdentifyUser < Actor
    HMAC_SECRET = ENV['JWT_HMAC_SECRET']
    ALGORITHM = 'HS256'

    input :header_authorization, type: String, allow_nil: true

    output :user

    play :validate_token,
         :fetch_user

    private

    def validate_token
      fail!(error: 'Missing token') unless header_authorization

      header_splitted = header_authorization.split
      fail!(error: 'Invalid token') if header_splitted.size != 2 || header_splitted[0] != 'Bearer'

      jwt_token = header_splitted[1]
      @decoded_token = JWT.decode jwt_token, HMAC_SECRET, true, { algorithm: ALGORITHM }
    rescue JWT::ExpiredSignature
      fail!(error: 'Expired token')
    rescue JWT::VerificationError
      fail!(error: 'Invalid token')
    end

    def fetch_user
      token_data = @decoded_token[0]
      self.user = User.find_by(id: token_data['id'])
      fail!(error: 'Invalid token - User not found!') unless user
    end
  end
end
