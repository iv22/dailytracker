# frozen_string_literal: true

# == Schema Information
#
# Table name: company_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer          not null
#  user_id    :integer          not null
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
class CompanyUser < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :company, presence: true
  validates :user, presence: true
end
