# == Schema Information
#
# Table name: apportionments
#
#  id                    :bigint           not null, primary key
#  dynamic_goal          :boolean
#  end_date              :date
#  goal                  :integer
#  show_goal_progress    :boolean
#  show_who_contributed  :boolean
#  start_date            :date
#  value_per_participant :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  event_id              :bigint           not null
#
# Indexes
#
#  index_apportionments_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class Apportionment < ApplicationRecord
  validates :start_date, presence: true
  validates :dynamic_goal, :show_goal_progress, :show_who_contributed, presence: true, inclusion: { in: [true, false] }
  validates :value_per_participant, :goal, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :value_per_participant, presence: true, if: :dynamic_goal
  validates :goal, presence: true, unless: :dynamic_goal

  belongs_to :event
end
