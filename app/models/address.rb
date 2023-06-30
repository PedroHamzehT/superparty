# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id           :bigint           not null, primary key
#  city         :string           not null
#  complement   :string
#  neighborhood :string           not null
#  number       :string           not null
#  state        :string           not null
#  street       :string           not null
#  zipcode      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  event_id     :bigint           not null
#
# Indexes
#
#  index_addresses_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class Address < ApplicationRecord
  validates :street, :number, :neighborhood, :zipcode, :state, :city, presence: true

  belongs_to :event
end
