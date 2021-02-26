# frozen_string_literal: true

# Invite maker for new Users
class UserInviter < ApplicationService
  def initialize(params, company)
    super()
    @member_params = params
    @company = company
  end

  def call
    ActiveRecord::Base.transaction do
      @member = User.invite!(@member_params)
      @company.company_users.create!(user: @member)
    end
    @member
  end
end
