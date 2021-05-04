# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TeamsController, type: :controller do
  let!(:manager_company) { manager_company_user.company }
  let!(:manager_company_user) { FactoryBot.create(:company_user, :manager) }
  let!(:manager) { manager_company_user.user }
  let!(:team) { FactoryBot.create(:team, name: 'Diamond', company: manager_company) }

  before { sign_in(manager, scope: :user) }

  describe 'GET #index' do
    it 'return a success response' do
      get :index, format: :json

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'return a success response' do
      get :show, format: :json, params: { id: team.to_param }

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'create a new team' do
      expect do
        post :create, format: :json, params: { team: { name: 'Diamond' }, company: manager_company }
      end.to change(Team, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT #update' do
    before do
      attr = { id: team.id, team: { name: 'Diamond' }, company: manager_company }

      put :update, format: :json, params: attr
    end

    it "should have status 'ok'" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a team' do
      expect do
        delete :destroy, format: :json, params: { id: team.to_param }
      end.to change(Team, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
