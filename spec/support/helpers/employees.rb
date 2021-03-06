# frozen_string_literal: true

module Helpers
  module Employees
    def user_fields(user, json = true)
      fields = {
        id: user.id,
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name,
        role: user.role
      }
      json ? fields.to_json : fields
    end
  end
end
