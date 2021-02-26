# frozen_string_literal: true

# Get Company for User model
class UserDecorator < Draper::Decorator
  delegate_all

  def company
    object.company_user&.company
  end
end
