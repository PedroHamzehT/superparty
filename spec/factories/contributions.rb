# == Schema Information
#
# Table name: contributions
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#
# Indexes
#
#  index_contributions_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
FactoryBot.define do
  factory :contribution do
    start_date { "2023-07-11" }
    end_date { "2023-07-11" }
    event { nil }
  end
end
