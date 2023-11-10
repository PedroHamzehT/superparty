# == Schema Information
#
# Table name: events
#
#  id           :bigint           not null, primary key
#  date         :date
#  description  :text
#  event_format :integer          not null
#  event_link   :string
#  name         :string
#  time         :time
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Event < ApplicationRecord
  validates :name, :description, :date, :event_format, presence: true

  enum event_format: %i[online on_site]

  has_one :address, dependent: :destroy
  has_one :contribution, dependent: :destroy

  has_many :invites, class_name: 'EventGuest', foreign_key: 'event_id'
  has_many :participants, through: :invites, source: :user
  has_many :contribution_items, through: :contribution
  has_many :apportionments, dependent: :destroy

  accepts_nested_attributes_for :address
end
