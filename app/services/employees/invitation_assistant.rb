# frozen_string_literal: true

module Employees
  class InvitationAssistant < ApplicationService
    attr_reader :member

    def initialize(member)
      super()
      @member = member
    end

    def call
      if member.status == 'invited'
        resend_invitation
      else
        { message: I18n.t("employees.invite.#{member.status}"), status: :not_acceptable }
      end
    end

    private

    def resend_invitation
      if member.resend_confirmation_instructions
        { message: I18n.t('employees.invite.resended'), status: :accepted }
      else
        { message: I18n.t('employees.invite.rejected'), status: :not_acceptable }
      end
    end
  end
end
