# frozen_string_literal: true

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
class Team < ApplicationRecord
  belongs_to :company, class_name: 'Company'
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users

  validates :name, presence: true
end
