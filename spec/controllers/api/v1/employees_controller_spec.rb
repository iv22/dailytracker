# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::EmployeesController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body) }

  let!(:manager_company_user) { FactoryBot.create(:company_user, :manager) }
  let!(:manager_company) { manager_company_user.company }
  let!(:manager) { manager_company_user.user }
  let!(:managed_employee) { FactoryBot.create(:company_user, company: manager_company).user }
  let!(:employee) { FactoryBot.create(:company_user).user }

  # Index
  describe 'GET #index' do
    context 'when User is not logged in' do
      before { get :index, format: :json }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Manager' do
      before do
        sign_in(manager, scope: :user)
        get :index, format: :json
      end

      it 'should see all coworkers' do
        expect(json.collect { |emp| emp['email'] }).to contain_exactly(manager.email, managed_employee.email)
      end
    end

    context 'when User logged in as Employee' do
      before do
        sign_in(employee, scope: :user)
        get :index, format: :json
      end

      it 'has not permission to see other Employees' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  # Show
  describe 'GET #show' do
    context 'when User is not logged in' do
      before { get :show, format: :json, params: { id: manager.id } }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Manager' do
      before { sign_in(manager, scope: :user) }

      it 'can see any coworker' do
        get :show, format: :json, params: { id: managed_employee.id }
        expect(json['email']).to eq(managed_employee.email)
      end

      it 'can not see Employees of other Companies' do
        get :show, format: :json, params: { id: employee.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Employee' do
      before { sign_in(employee, scope: :user) }

      it 'can not get Employee by ID' do
        get :show, format: :json, params: { id: employee.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  # Create
  describe 'POST #create' do
    before do
      @params = { 'member' => {
        'email' => Faker::Internet.unique.email,
        'first_name' => employee.first_name,
        'last_name' => employee.last_name,
        'role' => employee.role
      } }
    end

    context 'when User is not logged in' do
      before { post :create, format: :json, params: @params }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Manager' do
      before { sign_in(manager, scope: :user) }

      it 'should create Employee' do
        post :create, format: :json, params: @params
        expect(json['email']).to eq(@params['member']['email'])
      end

      it 'should have the same Company' do
        post :create, format: :json, params: @params
        new_company = User.find(json['id']).company_user.company
        expect(new_company).to eq(manager_company)
      end

      it "should reject invalid Employee's role" do
        post :create, format: :json, params: { 'member' => { 'role' => 'admin' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when User logged in as Employee' do
      before { sign_in(employee, scope: :user) }

      it 'can not create new Employee' do
        post :create, format: :json, params: @params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  # Update
  describe 'PUT #update' do
    before do
      @params = { id: managed_employee.id,
                  'member' => {
                    'email' => managed_employee.email,
                    'first_name' => managed_employee.first_name,
                    'last_name' => managed_employee.last_name,
                    'role' => managed_employee.role
                  } }
    end

    context 'when User is not logged in' do
      before { put :update, format: :json, params: @params }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Manager' do
      before { sign_in(manager, scope: :user) }

      it 'should update Employee' do
        put :update, format: :json, params: @params
        expect(response).to have_http_status(:ok)
      end

      it "should reject invalid Employee's role" do
        put :update, format: :json, params: { id: managed_employee.id, 'member' => { 'role' => 'admin' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when User logged in as Employee' do
      before { sign_in(employee, scope: :user) }

      it 'can not create new Employee' do
        put :update, format: :json, params: @params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  # Destroy
  describe 'DELETE #destroy' do
    context 'when User is not logged in' do
      before { delete :destroy, format: :json, params: { id: manager.id } }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Manager' do
      before do
        sign_in(manager, scope: :user)
        delete :destroy, format: :json, params: { id: managed_employee.id }
      end

      it 'should delete Employee at the same Company' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when User logged in as Employee' do
      before do
        sign_in(employee, scope: :user)
        delete :destroy, format: :json, params: { id: employee.id }
      end

      it 'can not delete Employee' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
