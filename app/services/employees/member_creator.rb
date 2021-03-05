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
      user = User.new(member_params)
      user.password = Devise.friendly_token.first(8)
      company.company_users.create!(user: user)
      user
    end
  end
end
