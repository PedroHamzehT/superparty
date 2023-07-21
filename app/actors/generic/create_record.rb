# frozen_string_literal: true

module Generic
  class CreateRecord < Actor
    input :klass
    input :params

    output :record

    play :create_record

    private

    def create_record
      record = klass.new(params)
      fail!(error: record.friendly_error_messages) unless record.save

      self.record = record
    end
  end
end
