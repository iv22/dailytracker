# frozen_string_literal: true

json.array! @members, partial: 'api/v1/employees/employee', as: :member
