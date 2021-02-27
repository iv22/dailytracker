# frozen_string_literal: true

module Api
  module V1
    # Invite maker for new Users
    class MemberParams < ApplicationService
      def initialize(params)
        super()
        @member_params = params.require(:member).permit(:email, :first_name, :last_name, :role)
      end

      def call
        role = @member_params[:role]
        return @member_params if %w[manager employee].include? role

        raise ArgumentError, "Invalid Role: #{role}"
      end
    end
  end
end
