# frozen_string_literal: true

module Employees
  class InvitationAssistant < ApplicationService
    attr_reader :member

    def initialize(member)
      super()
      @member = member
    end

    def call
      if member.status == 'active'
        { message: I18n.t('employees.invite.already_confirmed'), status: :not_acceptable }
      elsif member.resend_confirmation_instructions
        { message: I18n.t('employees.invite.resended'), status: :accepted }
      else
        { message: I18n.t('employees.invite.rejected'), status: :not_acceptable }
      end
    end
  end
end
