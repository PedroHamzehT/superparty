# frozen_string_literal: true

module Users
  class PasswordValidator < ActiveModel::Validator
    def validate(record)
      # Minimum length requirement
      unless record.password.length >= 8
        record.errors.add(:password, 'must be at least 8 characters long')
        return
      end

      record.errors.add(:password, 'must contain at least one uppercase letter') unless record.password.match?(/[A-Z]/)
      record.errors.add(:password, 'must contain at least one lowercase letter') unless record.password.match?(/[a-z]/)
      record.errors.add(:password, 'must contain at least one number') unless record.password.match?(/[0-9]/)

      unless record.password.match?(/[^A-Za-z0-9]/)
        record.errors.add(:password, 'must contain at least one special character')
      end
    end
  end
end
