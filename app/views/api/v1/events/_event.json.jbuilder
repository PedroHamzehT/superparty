# frozen_string_literal: true

json.extract! event, :id, :name, :description, :event_format, :event_link, :date, :time, :created_at, :updated_at

if event.address.present?
  json.address do
    json.extract! event.address, :id, :street, :number, :neighborhood, :zipcode, :complement, :state, :city
  end
end
