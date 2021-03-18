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
class TeamUser < ApplicationRecord
  belongs_to :team, class_name: 'Team'
  belongs_to :user, class_name: 'User'
end
