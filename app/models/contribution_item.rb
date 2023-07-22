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
class ContributionItem < ApplicationRecord
  validates :name, :max_amount_allowed, presence: true
  validates :max_amount_allowed, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :contribution

  def event
    @event ||= contribution.event
  end
end
