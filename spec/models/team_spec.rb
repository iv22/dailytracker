# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_teams_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require 'rails_helper'

RSpec.describe Team, type: :model do
  # Associations
  it { is_expected.to belong_to :company }
  it { is_expected.to have_many :team_users }
  it { is_expected.to have_many(:users).through(:team_users) }

  # Columns
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:company_id).of_type(:integer) }
  
  # Validations
  it { is_expected.to validate_presence_of :name }
end
