# == Schema Information
#
# Table name: users
#
#  id                                :bigint           not null, primary key
#  auth_token                        :string
#  auth_token_confirmed_at           :datetime
#  email                             :string           not null
#  first_name                        :string
#  last_name                         :string
#  password_digest                   :string
#  reset_password_token              :string
#  reset_password_token_confirmed_at :datetime
#  role                              :integer          default("standard")
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
