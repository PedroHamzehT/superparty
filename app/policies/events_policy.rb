# frozen_string_literal: true

class EventsPolicy < ApplicationPolicy
  def update?
    user.admin? || record.user_id == user.id
  end
end
