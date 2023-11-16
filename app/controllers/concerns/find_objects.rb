# frozen_string_literal: true

module FindObjects
  def find_event
    @event = policy_scope(Event).find_by(id: params[:event_id] || params[:id])
    raise ObjectNotFoundError, 'event' unless @event
  end

  def find_contribution
    find_event unless @event

    @contribution = @event.contribution
    raise ObjectNotFoundError, 'contribution' unless @contribution
  end

  def find_contribution_item
    find_contribution unless @contribution

    @contribution_item = @contribution.contribution_items.find_by(id: params[:contribution_item_id] || params[:id])
    raise ObjectNotFoundError, 'contribution_item' unless @contribution_item
  end

  def find_apportionment
    @apportionment = @event.apportionments.find_by(id: params[:apportionment_id] || params[:id])
    raise ObjectNotFoundError, :apportionment unless @apportionment
  end
end
