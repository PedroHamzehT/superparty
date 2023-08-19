# frozen_string_literal: true

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
class Contribution < ApplicationRecord
  validates :suggestions_allowed, :auto_create_suggestions, :show_who_contributed, inclusion: { in: [true, false] }

  belongs_to :event

  has_many :contribution_items, dependent: :destroy
end
