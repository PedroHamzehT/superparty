# frozen_string_literal: true

class ContributionPolicy < ApplicationPolicy
  def see_user_contributions?
    user.admin? || record.event.user_id == user.id || record.show_who_contributed?
  end
end
