# frozen_string_literal: true

class ContributionSuggestionPolicy < ApplicationPolicy
  def index?
    can_see_event?(event)
  end

  def create?
    can_see_event?(event)
  end

  def destroy?
    can_change_event?(event) || suggestion_owner?
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  private

  def event
    record.contribution.event
  end

  def suggestion_owner?
    record.user_id == user.id
  end
end
