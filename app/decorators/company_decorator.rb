# frozen_string_literal: true

# Get Company for User model
class CompanyDecorator < Draper::Decorator
  delegate_all

  def members
    User.joins(:company_user).where('company_id = ?', object.id)
  end
end
