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
require 'rails_helper'

RSpec.describe Apportionment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
