# frozen_string_literal: true

module Employees
  # Check current User role
  class UserPolicy < ApplicationPolicy
    include PermissionChecker

    def index?
      manager?
    end

    def create?
      manager?
    end

    def show?
      manager_for?(record)
    end

    def update?
      manager_for?(record)
    end

    def destroy?
      manager_for?(record)
    end

    def upload?
      manager?
    end

    def lock?
      manager_for?(record)
    end

    def unlock?
      manager_for?(record)
    end
  end
end
