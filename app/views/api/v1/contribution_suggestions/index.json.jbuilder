# frozen_string_literal: true

json.contribution_suggestions @contribution_suggestions,
                              partial: 'api/v1/contribution_suggestions/contribution_suggestion',
                              as: :contribution_suggestion
