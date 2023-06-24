# frozen_string_literal: true

class BaseService
  attr_reader :errors

  STANDARD_PUBLIC_METHODS = %i[errors call].freeze

  class << self
    def call(arguments = {})
      arguments = format_aguments(arguments)

      service = new
      service.call(**arguments)

      service_response(service)
    rescue ArgumentError => e
      missing_arguments = e.message.split(' ')[2..].join(' ').gsub(':', '')
      service.add_error("The following required arguments are missing: #{missing_arguments}")

      service_response(service)
    end

    private

    def service_response(service)
      response_attributes = (service.public_methods(false) - STANDARD_PUBLIC_METHODS).reduce({}) do |response, attr|
        response.merge({ attr => service.public_send(attr) })
      end

      OpenStruct.new({ success: service.errors.empty?, errors: service.errors }.merge(response_attributes))
    end

    def format_aguments(arguments)
      arguments = arguments.to_h if arguments.is_a?(ActionController::Parameters)
      arguments.deep_symbolize_keys
    end
  end

  def initialize
    @errors = []
  end

  def call
    NotImplementedError
  end

  def add_error(error)
    @errors << error
  end
end
