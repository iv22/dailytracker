# frozen_string_literal: true

# == Schema Information
#
# Table name: company_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_company_users_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
FactoryBot.define do
  factory :company_user do
    association :company, factory: :company
    association :user, factory: :employee_user

    trait :manager do
      association :user, factory: :manager_user
    end
  end
end
