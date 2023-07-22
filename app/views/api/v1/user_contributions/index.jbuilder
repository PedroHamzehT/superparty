# frozen_string_literal: true

json.user_contributions @user_contributions, partial: 'api/v1/user_contributions/user_contribution', as: :user_contribution
