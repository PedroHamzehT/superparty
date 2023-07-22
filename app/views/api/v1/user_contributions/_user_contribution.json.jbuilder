# frozen_string_literal: true

json.user_contribution do
  json.id user_contribution.id

  json.user do
    json.name user_contribution.user.name
    json.email user_contribution.user.email
  end

  json.created_at user_contribution.created_at
  json.updated_at user_contribution.updated_at
end
