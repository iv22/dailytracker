# frozen_string_literal: true

module Employees
  class MemberInviter < ApplicationService
    attr_reader :member_params, :company

    def initialize(params, company)
      super()
      @member_params = params
      @company = company
    end

    def call
      ActiveRecord::Base.transaction do
        member = User.invite!(member_params)
        company.company_users.create!(user: member)
      end
    end
  end
end
