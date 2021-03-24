# frozen_string_literal: true

module Helpers
  module Employees
    def user_fields(user, json = true)
      u = user.decorate
      fields = {
        id: u.id,
        email: u.email,
        first_name: u.first_name,
        last_name: u.last_name,
        role: u.role,
        phone: u.phone,
        status: u.status
      }
      json ? fields.to_json : fields
    end
  end
end
