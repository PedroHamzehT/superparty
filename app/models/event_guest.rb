# == Schema Information
#
# Table name: event_guests
#
#  id                 :bigint           not null, primary key
#  confirmation_token :string
#  confirmed_at       :datetime
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  event_id           :bigint           not null
#  user_id            :bigint
#
# Indexes
#
#  index_event_guests_on_event_id  (event_id)
#  index_event_guests_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (user_id => users.id)
#
class EventGuest < ApplicationRecord
  validates :confirmation_token, uniqueness: true, if: -> { confirmation_token.present? }
  validates :email, :user_id, uniqueness: true, scope: [:event_id]

  belongs_to :user, optional: true
  belongs_to :event
end
