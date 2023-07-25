# frozen_string_literal: true

class UserContributionPolicy < ApplicationPolicy
  def create?
    can_change_event?(event) || user.participant_of?(event)
  end

  def destroy?
    can_change_event?(event) || contribution_owner?
  end

  private

  def contribution_owner?
    record.user_id == user.id
  end

  def event
    @event ||= record.event
  end
end
