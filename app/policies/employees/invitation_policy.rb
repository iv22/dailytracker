# frozen_string_literal: true

module Employees
  class InvitationPolicy < ApplicationPolicy
    include Credentials

    def create?
      manager_for?(record)
    end
  end
end
