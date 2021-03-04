# frozen_string_literal: true

module Helpers
  module Employees
    def user_fields(user)
      {
        id: user.id,
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name,
        role: user.role
      }
    end

    def user_params
      {
        email: Faker::Internet.unique.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        role: 'employee'
      }
    end
  end
end
