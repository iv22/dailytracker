# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string(180)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Company, type: :model do
  # Associations
  it { is_expected.to have_many :company_users }

  # Columns
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

  # Validations
  it { is_expected.to validate_presence_of :name }
end
