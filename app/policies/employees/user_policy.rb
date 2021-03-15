# frozen_string_literal: true

module Employees
  # Check current User credentials
  class UserPolicy < ApplicationPolicy
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

    private

    def manager?
      user.role == 'manager'
    end

    def manager_for?(member)
      manager? && user.company_user.company == member.company
    end
  end
end
