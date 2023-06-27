class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def friendly_error_messages
    errors.full_messages.join(', ')
  end
end
