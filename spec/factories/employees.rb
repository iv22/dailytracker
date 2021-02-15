# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    association :company, factory: :company
    association :user, factory: :employee_user
  end
end
