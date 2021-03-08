# frozen_string_literal: true

require 'rails_helper'

# User Log-in as a Manager
RSpec.describe Api::V1::EmployeesController, type: :controller do
  let!(:manager_company_user) { FactoryBot.create(:company_user, :manager) }
  let!(:manager) { manager_company_user.user }

  before :each do
    sign_in(manager, scope: :user)
    @file = fixture_file_upload('files/employees.csv', 'text/csv')
  end

  it "should upload a csv-file" do
    post :upload, format: :json, params: { employees: @file }
    expect(response).to have_http_status(:created)
  end
end
