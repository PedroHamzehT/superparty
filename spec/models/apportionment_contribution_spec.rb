# == Schema Information
#
# Table name: apportionment_contributions
#
#  id               :bigint           not null, primary key
#  amount_in_cents  :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  apportionment_id :bigint           not null
#  event_guest_id   :bigint           not null
#
# Indexes
#
#  index_apportionment_contributions_on_apportionment_id  (apportionment_id)
#  index_apportionment_contributions_on_event_guest_id    (event_guest_id)
#
# Foreign Keys
#
#  fk_rails_...  (apportionment_id => apportionments.id)
#  fk_rails_...  (event_guest_id => event_guests.id)
#
require 'rails_helper'

RSpec.describe ApportionmentContribution, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
