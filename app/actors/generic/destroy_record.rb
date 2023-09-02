# frozen_string_literal: true

module Generic
  class DestroyRecord < Actor
    input :record

    play :destroy_record

    private

    def destroy_record
      fail!(error: record.friendly_error_messages) unless record.destroy
    end
  end
end
