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
require 'rails_helper'

RSpec.describe TeamUser, type: :model do
  # Associations
  it { is_expected.to belong_to :team }
  it { is_expected.to belong_to :user }
  
  # Columns
  it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  it { is_expected.to have_db_column(:team_id).of_type(:integer) }
  it { is_expected.to have_db_column(:is_team_lead).of_type(:boolean) }
end
