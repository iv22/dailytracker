# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::EmployeesController, type: :controller do
  let!(:manager_company_user) { FactoryBot.create(:company_user, :manager) }
  let!(:manager_company) { manager_company_user.company }
  let!(:manager) { manager_company_user.user }
  let!(:managed_employee) { FactoryBot.create(:company_user, company: manager_company).user }
  let!(:managed_locked_employee) do
    FactoryBot.create(:company_user,
                      company: manager_company, user: FactoryBot.create(:user, :locked, :employee)).user
  end

  before do
    sign_in(manager, scope: :user)
  end

  describe '#lock' do
    context 'when User not locked yet' do
      it 'should return success message and status' do
        post :lock, format: :json, params: { 'id' => managed_employee.id }

        expect(response.body).to be_json_eql({ message: I18n.t('employees.lock.success') }.to_json)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when User already locked' do
      it 'should return error message and status' do
        post :lock, format: :json, params: { 'id' => managed_locked_employee.id }

        expect(response.body).to be_json_eql({ message: I18n.t('employees.lock.locked_status') }.to_json)
        expect(response).to have_http_status(:not_acceptable)
      end
    end
  end

  describe '#unlock' do
    context 'when User is locked' do
      it 'should return success message and status' do
        post :unlock, format: :json, params: { 'id' => managed_locked_employee.id }

        expect(response.body).to be_json_eql({ message: I18n.t('employees.unlock.success') }.to_json)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when User already unlocked' do
      it 'should return error message and status' do
        post :unlock, format: :json, params: { 'id' => managed_employee.id }

        expect(response.body).to be_json_eql({ message: I18n.t('employees.unlock.active_status') }.to_json)
        expect(response).to have_http_status(:not_acceptable)
      end
    end
  end
end
