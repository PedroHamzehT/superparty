# == Schema Information
#
# Table name: contribution_suggestions
#
#  id              :bigint           not null, primary key
#  description     :text
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contribution_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_contribution_suggestions_on_contribution_id  (contribution_id)
#  index_contribution_suggestions_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (contribution_id => contributions.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe ContributionSuggestion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
