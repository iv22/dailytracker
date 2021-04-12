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
class TeamUser < ApplicationRecord
  belongs_to :team, class_name: 'Team'
  belongs_to :user, class_name: 'User'
end
