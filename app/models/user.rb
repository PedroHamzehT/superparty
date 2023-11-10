# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                :bigint           not null, primary key
#  email                             :string           not null
#  first_name                        :string
#  last_name                         :string
#  one_time_password                 :integer
#  one_time_password_confirmed_at    :datetime
#  one_time_password_created_at      :datetime
#  password_digest                   :string
#  reset_password_token              :string
#  reset_password_token_confirmed_at :datetime
#  role                              :integer          default("standard")
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
class User < ApplicationRecord
  attr_accessor :passwordless_creation

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid' }
  validates :reset_password_token, uniqueness: true, if: -> { reset_password_token.present? }
  validates :first_name, :last_name, presence: true, unless: -> { passwordless_creation }
  validates :password_confirmation, presence: true, if: -> { password.present? }
  validates_with Users::PasswordValidator

  has_many :events
  has_many :invitations, class_name: 'EventGuest', foreign_key: 'user_id'
  has_many :participating_events, through: :invitations, source: :event
  has_many :user_contributions, dependent: :destroy

  enum role: %i[standard admin]

  def name
    [first_name, last_name].join(' ').strip
  end

  def participant_of?(event)
    participating_events.where(id: event.id).present?
  end
end
