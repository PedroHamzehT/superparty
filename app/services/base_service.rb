# frozen_string_literal: true

class BaseService
  attr_reader :errors

  STANDARD_PUBLIC_METHODS = %i[errors call].freeze

  def initialize
    @errors = []
  end

  def self.call(arguments = {})
    service = new
    service.call(**arguments)

    service_response(service)
  end

  def call
    NotImplementedError
  end

  private_class_method def self.service_response(service)
    response_attributes = (service.public_methods(false) - STANDARD_PUBLIC_METHODS).reduce({}) do |response, attr|
      response.merge({ attr => service.public_send(attr) })
    end

    OpenStruct.new({ success: service.errors.empty?, errors: service.errors }.merge(response_attributes))
  end

  private

  def add_error(error)
    @errors << error
  end
end
