# frozen_string_literal: true

require 'rails_helper'

# User Log-in as a Manager
RSpec.describe Api::V1::EmployeesController, type: :controller do
  let!(:manager_company_user) { FactoryBot.create(:company_user, :manager) }
  let!(:manager) { manager_company_user.user }

  context 'attachment is valid csv-file' do
    before do
      sign_in(manager, scope: :user)
      @file = fixture_file_upload('files/employees.csv', 'text/csv')
      post :upload, format: :json, params: { employees: @file }
    end

    it "should response with status 'created'" do
      expect(response).to have_http_status(:created)
    end

    it 'should have valid collection size of response' do
      expect(response.body).to have_json_size(2)
    end
  end

  context 'no attachment' do
    before :each do
      sign_in(manager, scope: :user)
    end

    it "should response with status 'created'" do
      post :upload, format: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
