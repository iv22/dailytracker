# frozen_string_literal: true

# == Schema Information
#
# Table name: team_users
#
#  id           :bigint           not null, primary key
#  is_team_lead :boolean          not null
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_id      :bigint           not null
#
# Indexes
#
#  index_team_users_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
FactoryBot.define do
    factory :team_user do
      association :team, factory: :team
      association :user, factory: :user
    end
  end
