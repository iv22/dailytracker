# frozen_string_literal: true

module Employees
  module PermissionChecker
    private

    def manager?
      user.role == 'manager'
    end

    def manager_for?(member)
      manager? && user.company_user.company == member.company
    end

    def current_team?(team)
      team.team_users.any? { |i| i.user_id == user.id }
    end

    def current_team_user?(team_user)
      Team.find(team_user.team_id).team_users.any? { |i| i.user_id == user.id }
    end
  end
end
