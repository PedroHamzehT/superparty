# frozen_string_literal: true

json.contribution_item do
  json.id contribution_item.id
  json.name contribution_item.name
  json.description contribution_item.description
  json.max_amount_allowed contribution_item.max_amount_allowed
  json.created_at contribution_item.created_at
  json.updated_at contribution_item.updated_at

  if ContributionPolicy.new(@current_user, @contribution).see_user_contributions?
    json.partial! contribution_item.user_contributions, as: :user_contribution
  end
end
