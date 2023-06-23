# frozen_string_literal: true

module Users
  class SignUpService < BaseService
    attr_reader :jwt_token

    def call(email:, password:, password_confirmation:)
      add_error("Password confirmation doesn't match Password") and return if password_confirmation != password

      user = User.new(email:, password:, password_confirmation:)
      unless user.save
        user.errors.full_messages.each { |error| add_error(error) }
        return
      end

      @jwt_token = Tokens::GenerateJwtService.call(user:)
    end
  end
end
