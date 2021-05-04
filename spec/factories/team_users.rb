# frozen_string_literal: true

# == Schema Information
#
# Table name: team_users
#
#  id           :bigint           not null, primary key
#  is_team_lead :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_id      :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_team_users_on_team_id  (team_id)
#  index_team_users_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
    factory :team_user do
      association :team, factory: :team
      association :user, factory: :employee_user
    end
  end
