# == Schema Information
#
# Table name: user_contributions
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  contribution_item_id :bigint           not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_user_contributions_on_contribution_item_id  (contribution_item_id)
#  index_user_contributions_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (contribution_item_id => contribution_items.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserContribution, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
