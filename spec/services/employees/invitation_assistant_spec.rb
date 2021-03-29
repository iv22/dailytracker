# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employees::InvitationAssistant, type: :controller do
  context 'when try to resend invite for confirmed employee' do
    before do
      member = FactoryBot.create(:employee_user).decorate
      @response = Employees::InvitationAssistant.call(member)
    end

    it "shouldn't accept operation" do
      expect(@response).to eq({ message: I18n.t("employees.invite.active"), status: :not_acceptable })
    end
  end

  context 'when try to resend invite for locked employee' do
    before do
      member = FactoryBot.create(:employee_user, :locked).decorate
      @response = Employees::InvitationAssistant.call(member)
    end

    it "shouldn't accept operation" do
      expect(@response).to eq({ message: I18n.t("employees.invite.locked"), status: :not_acceptable })
    end
  end

  context 'when try to resend invite for invited employee' do
    before do
      member = FactoryBot.create(:employee_user, :invited).decorate
      @response = Employees::InvitationAssistant.call(member)
    end

    it "should accept operation" do
      expect(@response).to eq({ message: I18n.t("employees.invite.resended"), status: :accepted })
    end
  end
end
