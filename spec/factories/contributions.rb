# == Schema Information
#
# Table name: contributions
#
#  id                      :bigint           not null, primary key
#  auto_create_suggestions :boolean          default(FALSE), not null
#  end_date                :date
#  show_who_contributed    :boolean          default(FALSE), not null
#  start_date              :date
#  suggestions_allowed     :boolean          default(FALSE), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  event_id                :bigint           not null
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
