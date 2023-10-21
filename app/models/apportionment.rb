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
  belongs_to :event
end
