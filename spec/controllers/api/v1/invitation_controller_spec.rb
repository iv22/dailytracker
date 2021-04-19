# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::InvitationController, type: :controller do
  let(:json_body) { response.body }

  let!(:manager_company_user) { FactoryBot.create(:company_user, :manager) }
  let!(:manager_company) { manager_company_user.company }
  let!(:manager) { manager_company_user.user }
  let!(:managed_employee) { FactoryBot.create(:company_user, company: manager_company).user }
  let!(:params) { {'id' => managed_employee.id } }

  context 'when User is Signed-in as a Manager' do
    before do
      expect_any_instance_of(Employees::InvitationAssistant).to receive(:call).
        and_return({message: 'invite_stub', status: :ok})
      sign_in(manager, scope: :user)
      post :create, format: :json, params: params
    end

    it 'should try to resend invite by calling service' do
      expect(json_body).to be_json_eql({message: 'invite_stub'}.to_json)
    end
  end

  context 'when User is Signed-in as an Employee' do
    before do
      post :create, format: :json, params: params
    end

    it 'has no permission to resend invite' do
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'when User is not Signed-in' do
    before do
      post :create, format: :json, params: params
    end

    it 'has no permission to resend invite' do
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
