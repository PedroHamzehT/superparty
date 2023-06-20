# frozen_string_literal: true

class BaseService
  attr_reader :errors

  STANDARD_METHODS = %i[call]

  def initialize
    @errors = []
  end

  def self.call(**arguments)
    service = new
    service.call(**arguments)

    service_response(service)
  end

  def call
    NotImplementedError
  end

  private

  def self.service_response(service)
    response_attributes = (service.public_methods(false) - STANDARD_METHODS).reduce({}) do |response, attr|
      response.merge({ attr => service.public_send(attr) })
    end

    { success: service.errors.empty?, errors: service.errors }.merge(response_attributes)
  end

  def add_error(error)
    self.errors << error
  end
end
