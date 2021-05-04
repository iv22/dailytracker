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
# TeamSerializer
class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :team_users

  def company
    if instance_options[:without_serializer]
      object.company
    else
      CompanySerializer.new(object.company,
                            without_serializer: true)
    end
  end
end
