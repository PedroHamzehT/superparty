# frozen_string_literal: true

json.events @events, partial: 'api/v1/events/event', as: :event
