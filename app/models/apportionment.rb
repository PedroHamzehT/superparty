# == Schema Information
#
# Table name: apportionments
#
#  id                             :bigint           not null, primary key
#  dynamic_goal                   :boolean          default(FALSE), not null
#  end_date                       :date
#  goal_in_cents                  :integer
#  show_goal_progress             :boolean          default(FALSE), not null
#  show_who_contributed           :boolean          default(FALSE), not null
#  start_date                     :date
#  value_per_participant_in_cents :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  event_id                       :bigint           not null
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
  validates :dynamic_goal, :show_goal_progress, :show_who_contributed, inclusion: { in: [true, false] }
  validates :value_per_participant_in_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: :dynamic_goal
  validates :goal_in_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, unless: :dynamic_goal

  belongs_to :event

  def goal
    return if goal_in_cents.blank?

    goal_in_cents * 100
  end

  def value_per_participant
    return if value_per_participant_in_cents.blank?

    value_per_participant_in_cents * 100
  end
end
