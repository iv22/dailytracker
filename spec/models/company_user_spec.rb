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
require 'rails_helper'

RSpec.describe CompanyUser, type: :model do
  # Associations
  it { is_expected.to belong_to :company }
  it { is_expected.to belong_to :user }

  # Columns
  it { is_expected.to have_db_column(:company_id).of_type(:integer) }
  it { is_expected.to have_db_column(:user_id).of_type(:integer) }

  # Validations
  it { is_expected.to validate_presence_of :company }
  it { is_expected.to validate_presence_of :user }
end
