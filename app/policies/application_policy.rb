# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  private

  def can_see_event?(event)
    user.admin? || event_admin?(event) || event_participant?(event)
  end

  def can_change_event?(event)
    user.admin? || event_admin?(event)
  end

  def event_admin?(event)
    event.user_id == user.id
  end

  def event_participant?(event)
    event.participants.find_by(id: user.id).present?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
