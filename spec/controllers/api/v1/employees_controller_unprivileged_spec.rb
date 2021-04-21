# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::EmployeesController, type: :controller do
  let!(:employee) { FactoryBot.create(:company_user).user }

  describe 'GET #index' do
    context 'when User is not logged in' do
      before { get :index, format: :json }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Employee' do
      before do
        sign_in(employee, scope: :user)
        get :index, format: :json
      end

      it 'has no permission to see other Employees' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET #show' do
    context 'when User is not logged in' do
      before { get :show, format: :json, params: { id: employee.id } }

      it 'should return unauthorized status' do
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

  describe 'POST #create' do
    context 'when User is not logged in' do
      before { post :create, format: :json }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Employee' do
      before { sign_in(employee, scope: :user) }

      it 'can not create new Employee' do
        post :create, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'PUT #update' do
    before do
      @params = { id: employee.id }
    end

    context 'when User is not logged in' do
      before { put :update, format: :json, params: @params }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
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

  describe 'DELETE #destroy' do
    context 'when User is not logged in' do
      before { delete :destroy, format: :json, params: { id: employee.id } }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
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

  describe 'POST #upload' do
    context 'when User is not logged in' do
      before { post :upload, format: :json }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Employee' do
      before { sign_in(employee, scope: :user) }

      it 'can not upload any file' do
        post :upload, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST #lock' do
    before do
      @params = { id: employee.id }
    end

    context 'when User is not logged in' do
      before { post :lock, format: :json, params: @params }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Employee' do
      before { sign_in(employee, scope: :user) }

      it 'can not lock any Employee' do
        post :lock, format: :json, params: @params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST #unlock' do
    before do
      @params = { id: employee.id }
    end

    context 'when User is not logged in' do
      before { post :unlock, format: :json, params: @params }

      it 'should return unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when User logged in as Employee' do
      before { sign_in(employee, scope: :user) }

      it 'can not unlock any Employee' do
        post :unlock, format: :json, params: @params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
