# frozen_string_literal: true

module Api
  module V1
    class InvitationController < UserController
      def create
        authorize! member, with: Employees::InvitationPolicy
        answer = Employees::InvitationAssistant.call(member)
        render json: { message: answer[:message] }, status: answer[:status]
      end
    end
  end
end
