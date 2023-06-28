# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                :bigint           not null, primary key
#  auth_token                        :string
#  auth_token_confirmed_at           :datetime
#  email                             :string           not null
#  first_name                        :string
#  last_name                         :string
#  password_digest                   :string
#  reset_password_token              :string
#  reset_password_token_confirmed_at :datetime
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
class User < ApplicationRecord
  attr_accessor :magic_link_creation

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid' }
  validates :auth_token, uniqueness: true, if: -> { auth_token.present? }
  validates :reset_password_token, uniqueness: true, if: -> { reset_password_token.present? }
  validates :first_name, :last_name, presence: true, unless: -> { @magic_link_creation }
  validates :password, :password_confirmation, presence: true, on: :create
  validates_with Users::PasswordValidator
end
