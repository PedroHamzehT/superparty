# frozen_string_literal: true

class EventGuestPolicy < ApplicationPolicy
  def index?
    can_see_event?(record.event)
  end

  def create?
    can_change_event?(record.event)
  end

  def destroy?
    can_change_event?(record.event)
  end
end
