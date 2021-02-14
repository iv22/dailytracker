# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#  user_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :company
end
