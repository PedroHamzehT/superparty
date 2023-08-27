# frozen_string_literal: true

json.extract! contribution_item, :id, :name, :description, :max_amount_allowed, :created_at, :updated_at

if ContributionPolicy.new(@current_user, @contribution).see_user_contributions?
  json.user_contributions contribution_item.user_contributions, partial: 'api/v1/user_contributions/user_contribution', as: :user_contribution
end
