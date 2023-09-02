# frozen_string_literal: true

class ObjectNotFoundError < StandardError
  attr_reader :object

  def initialize(object, message = nil)
    @object = object
    super(message)
  end
end
