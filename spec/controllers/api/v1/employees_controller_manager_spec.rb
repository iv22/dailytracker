# frozen_string_literal: true

require 'rails_helper'

# User Log-in as a Manager
RSpec.describe Api::V1::EmployeesController, type: :controller do
  let(:json_body) { response.body }

  let!(:manager_company_user) { FactoryBot.create(:company_user, :manager) }
  let!(:manager_company) { manager_company_user.company }
  let!(:manager) { manager_company_user.user }
  let!(:managed_employee) { FactoryBot.create(:company_user, company: manager_company).user }
  let!(:employee) { FactoryBot.create(:company_user).user }

  before { sign_in(manager, scope: :user) }

  describe 'GET #index' do
    before { get :index, format: :json }

    it 'should see all coworkers' do
      expect(json_body).to be_json_eql([
        user_fields(manager),
        user_fields(managed_employee)
      ].to_json)
    end
  end

  describe 'GET #show' do
    it 'can see any coworker' do
      get :show, format: :json, params: { id: managed_employee.id }
      expect(json_body).to be_json_eql(user_fields(managed_employee).to_json)
    end

    it 'should use UserSerializer' do
      get :show, format: :json, params: { id: managed_employee.id }
      assert_serializer 'UserSerializer'
    end

    it 'can not see Employees of other Companies' do
      get :show, format: :json, params: { id: employee.id }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST #create' do
    before do
      @params = { 'member' => {
        'email' => Faker::Internet.unique.email,
        'first_name' => employee.first_name,
        'last_name' => employee.last_name,
        'role' => employee.role
      } }

      post :create, format: :json, params: @params
      @user = User.find_by(email: @params['member']['email'])
    end

    it 'should create Employee' do
      expect(json_body).to be_json_eql(user_fields(@user).to_json)
    end

    it 'should have the same Company' do
      new_company = @user.company_user.company
      expect(new_company).to eq(manager_company)
    end
  end

  describe 'PUT #update' do
    before do
      @params = { id: managed_employee.id,
                  'member' => {
                    'email' => managed_employee.email,
                    'first_name' => "f#{managed_employee.first_name}",
                    'last_name' => "l#{managed_employee.last_name}",
                    'role' => managed_employee.role
                  } }

      put :update, format: :json, params: @params
    end

    it 'should update Employee' do
      user = User.find(managed_employee.id)
      expected_user = User.new(@params['member'])
      expected_user.id = managed_employee.id
      expect(user).to eq(expected_user)
    end

    it "should have 'ok' status" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE #destroy' do
    before do
      delete :destroy, format: :json, params: { id: managed_employee.id }
    end

    it 'should delete Employee at the same Company' do
      user = User.where(id: managed_employee.id)
      expect(user.empty?).to be_truthy
    end

    it 'should generate :no_content response' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
