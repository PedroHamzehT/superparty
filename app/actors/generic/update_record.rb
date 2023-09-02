# frozen_string_literal: true

module Generic
  class UpdateRecord < Actor
    input :record
    input :params

    play :update_record

    private

    def update_record
      fail!(error: record.friendly_error_messages) unless record.update(params)
    end
  end
end
