# frozen_string_literal: true

module Employees
  # Check current User role
  class UserPolicy < ApplicationPolicy
    include PermissionChecker

    def index?
      manager?
    end

    def show?
      manager_for?(record)
    end

    %i[create? upload?].each { |method| alias_method method, :index? }
    %i[update? destroy? lock? unlock?].each { |method| alias_method method, :show? }
  end
end
