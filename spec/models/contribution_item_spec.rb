# == Schema Information
#
# Table name: contribution_items
#
#  id                 :bigint           not null, primary key
#  description        :text
#  max_amount_allowed :integer          default(1), not null
#  name               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  contribution_id    :bigint           not null
#
# Indexes
#
#  index_contribution_items_on_contribution_id  (contribution_id)
#
# Foreign Keys
#
#  fk_rails_...  (contribution_id => contributions.id)
#
require 'rails_helper'

RSpec.describe ContributionItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
