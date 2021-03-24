# frozen_string_literal: true

module Employees
  # Check current User credentials
  class UserPolicy < ApplicationPolicy
    include Credentials

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
  end
end
