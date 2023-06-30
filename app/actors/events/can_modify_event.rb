# frozen_string_literal: true

module Events
  class CanModifyEvent < Actor
    input :event, type: Event
    input :current_user, type: User
    input :action, type: String

    output :can_modify

    play :validate_permission

    private

    def validate_permission
      self.can_modify = event.user_id == current_user.id
      fail!(error: "User can't #{action} this event") unless can_modify
    end
  end
end
