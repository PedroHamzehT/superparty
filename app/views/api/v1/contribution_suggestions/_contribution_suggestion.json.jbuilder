# frozen_string_literal: true

json.extract! contribution_suggestion, :id, :name, :description, :created_at, :updated_at do
  json.created_by do
    json.id contribution_suggestion.user.id
    json.name contribution_suggestion.user.name
  end
end
