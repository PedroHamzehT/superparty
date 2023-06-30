# == Schema Information
#
# Table name: event_guests
#
#  id                 :bigint           not null, primary key
#  confirmation_token :string
#  confirmed_at       :datetime
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  event_id           :bigint           not null
#  user_id            :bigint
#
# Indexes
#
#  index_event_guests_on_event_id  (event_id)
#  index_event_guests_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :event_guest do
    email { "MyString" }
    user { nil }
    confirmation_token { "MyString" }
    event { nil }
    confirmed_at { "2023-06-29 23:28:34" }
  end
end
