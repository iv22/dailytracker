# frozen_string_literal: true

module Employees
  class MemberCreator < ApplicationService
    attr_reader :member_params, :company

    def initialize(params, company)
      super()
      @member_params = params
      @company = company
    end

    def call
      member = nil
      ActiveRecord::Base.transaction do
        member = Employees::MemberInviter.call(member_params)
        company.company_users.create!(user: member)
      end
      member
    end
  end
end
