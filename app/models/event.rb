# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :text
#  name        :string
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
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
  validates :name, :description, :date, presence: true

  belongs_to :organizer, class_name: 'User', foreign_key: 'user_id'
end
