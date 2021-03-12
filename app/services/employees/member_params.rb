# frozen_string_literal: true

module Employees
  class MemberParams < ApplicationService
    attr_reader :member_params

    def initialize(params)
      super()
      @member_params = params.require(:member).permit(User.permitted_props)
    end

    def call
      role = member_params[:role]
      return member_params if %w[manager employee].include? role

      raise ArgumentError, "Invalid Role: #{role}"
    end
  end
end
