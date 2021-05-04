# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TeamUsersController, type: :controller do
  let!(:manager_company) { manager_company_user.company }
  let!(:manager_company_user) { FactoryBot.create(:company_user, :manager) }
  let!(:manager) { manager_company_user.user }
  let!(:team) { FactoryBot.create(:team, name: 'Diamond', company: manager_company) }
  let!(:user) { FactoryBot.create(:employee_user) }
  let!(:team_user) { FactoryBot.create(:team_user, team: team, user: user, is_team_lead: false) }

  before { sign_in(manager, scope: :user) }

  describe 'GET #index' do
    it 'return a success response' do
      get :index, format: :json, params: { team_id: team.id }

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'return a success response' do
      get :show, format: :json, params: { team_id: team.id, id: team_user.to_param }

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'create a new team_user' do
      expect do
        post :create, format: :json, params: { team_id: team.id, team_user: { user_id: user, is_team_lead: false } }
      end.to change(TeamUser, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT #update' do
    before do
      attr = { team_id: team.id, id: team_user.id, team_user: { team: team, user: user, is_team_lead: false } }

      put :update, format: :json, params: attr
    end

    it "should have status 'ok'" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a team' do
      expect do
        delete :destroy, format: :json, params: { team_id: team.id, id: team_user.to_param }
      end.to change(TeamUser, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
