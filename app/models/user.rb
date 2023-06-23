# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :magic_link_creation

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid' }
  validates :auth_token, uniqueness: true
  validates :first_name, :last_name, presence: true, unless: -> { @magic_link_creation }
  validates :password, :password_confirmation, presence: true, on: :create
end
