# frozen_string_literal: true

module Teams
  class TeamsPolicy < ApplicationPolicy
    include Employees::PermissionChecker

    def index?
      manager?
    end

    def show?
      manager? || current_team?(record)
    end

    %i[create?].each { |method| alias_method method, :index? }
    %i[update? destroy?].each { |method| alias_method method, :show? }
  end
end
