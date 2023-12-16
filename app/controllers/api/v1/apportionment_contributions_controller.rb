# frozen_string_literal: true

module Api
  module V1
    class ApportionmentContributionsController < ApplicationController
      include FindObjects

      before_action :authenticate_user!
      before_action :find_apportionment

      def create
        authorize @event

        @result = Generic::CreateRecord.result(
          klass: ApportionmentContribution,
          params: apportionment_contribution_params.merge(apportionment_id: @apportionment.id)
        )
        return error_response if @result.failure?

        head :created
      end

      def destroy
        authorize @event

        apportionment_contribution = @apportionment.apportionment_contributions.find_by(id: params[:id])
        @result = Generic::DestroyRecord.result(record: apportionment_contribution)
        return error_response if @result.failure?
      end

      private

      def apportionment_contribution_params
        params.require(:apportionment_contribution).permit(:event_guest_id, :amount_in_cents)
      end
    end
  end
end
