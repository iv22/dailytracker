# frozen_string_literal: true

module Teams
  class TeamUsersPolicy < ApplicationPolicy
    include Employees::PermissionChecker

    def index?
      manager? || current_team?(record)
    end

    def show?
      manager? || current_team_user?(record)
    end

    def create?
      manager?
    end

    %i[update? destroy?].each { |method| alias_method method, :create? }
  end
end
