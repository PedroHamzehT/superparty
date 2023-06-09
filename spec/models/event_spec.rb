# == Schema Information
#
# Table name: events
#
#  id           :bigint           not null, primary key
#  date         :date
#  description  :text
#  event_format :integer          not null
#  event_link   :string
#  name         :string
#  time         :time
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
