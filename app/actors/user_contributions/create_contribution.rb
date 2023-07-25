# frozen_string_literal: true

module UserContributions
  class CreateContribution < Actor
    input :user, type: User
    input :contribution_item, type: ContributionItem

    output :user_contribution

    play :check_availability,
         :create_contribution

    private

    def check_availability
      limit_exceeded = contribution_item.user_contributions.size >= contribution_item.max_amount_allowed
      fail!(error: 'Limit exceeded for this item') if limit_exceeded
    end

    def create_contribution
      user_contribution = UserContribution.new(user:, contribution_item:)
      fail!(error: user_contribution.friendly_error_messages) unless user_contribution.save

      self.user_contribution = user_contribution
    end
  end
end
