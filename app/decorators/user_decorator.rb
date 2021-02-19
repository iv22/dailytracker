# frozen_string_literal: true

# Get Company for User model
class UserDecorator < Draper::Decorator
  delegate_all

  def company
    object.company_user&.company
  end

  def managed_by?(current)
    current.role == 'manager' && current.company_user.company == company
  end

  def mastered_by?(current)
    # implementation will be here
    false
  end
end
