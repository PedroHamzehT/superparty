# == Schema Information
#
# Table name: users
#
#  id                                :bigint           not null, primary key
#  email                             :string           not null
#  first_name                        :string
#  last_name                         :string
#  one_time_password                 :string
#  one_time_password_confirmed_at    :datetime
#  one_time_password_created_at      :datetime
#  password_digest                   :string
#  reset_password_token              :string
#  reset_password_token_confirmed_at :datetime
#  role                              :integer          default("standard")
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
FactoryBot.define do
  factory :user do
    email { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    password_digest { "MyString" }
    token { "MyString" }
    auth_token { "MyString" }
  end
end
