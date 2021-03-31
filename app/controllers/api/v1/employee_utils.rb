# frozen_string_literal: true

module Api
  module V1
    module EmployeeUtils
      private

      def company
        @company ||= current_user.company_user&.company&.decorate
      end

      def member
        @member ||= User.find(params[:id]).decorate
      end
    end
  end
end
