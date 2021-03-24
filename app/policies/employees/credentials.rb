# frozen_string_literal: true

module Employees
  module Credentials
    private

    def manager?
      user.role == 'manager'
    end

    def manager_for?(member)
      manager? && user.company_user.company == member.company
    end
  end
end
