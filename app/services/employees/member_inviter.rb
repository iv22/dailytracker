# frozen_string_literal: true

module Employees
  class MemberInviter < ApplicationService
    attr_reader :user

    def initialize(user)
      super()
      @user = user
    end

    def call
      user.invite!
    end
  end
end
