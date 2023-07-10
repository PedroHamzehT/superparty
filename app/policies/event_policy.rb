# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  def index?
    can_see_event?(record)
  end

  def show?
    can_see_event?(record)
  end

  def update?
    can_change_event?(record)
  end

  def destroy?
    can_change_event?(record)
  end

  class Scope < Scope
    def resolve
      return scope.all if user.admin?

      scope.left_outer_joins(:participants).where(users: { id: user.id }).or(scope.where(user_id: user.id))
    end
  end
end
