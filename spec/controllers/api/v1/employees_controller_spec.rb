# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::EmployeesController, type: :controller do
  let(:manager) { FactoryBot.create(:company_user, :manager).user }
  let(:employee) { FactoryBot.create(:company_user).user }

  describe 'GET #current' do
    context 'when User is not logged in' do      
      before {get :current}

      it 'should redirect to Sign in page' do
        expect(subject).to redirect_to(new_user_session_path)
      end  
    end

    context 'when User logged in as Manager' do
      before do
        sign_in(manager, scope: :user)
        # get :show, params: { id: manager.id }, format: :json
        get :current, format: :json
      end

      it 'should render show' do
        # expect_render(hash_including(:json => anything))
        expect(response.html).to eq(manager.to_json) 
        # expect(response).to render_template(:show)
        # expect(@user).to be(12345)
      end  
    end

    # context 'when User logged in as Employee' do
    #   it 'should render index' do
    #     expect(@user).to be(12345)
    #   end        
    # end
  end

  describe 'GET #index' do
  end

  describe 'POST #create' do
  end

  describe 'GET #show' do
  end

  describe 'PUT #update' do
  end

  describe 'DELETE #current' do
  end
end



# RSpec.describe HomeController, type: :controller do
#   describe 'GET #index' do
#     context 'when User is Signed-in' do
#       before do
#         user = FactoryBot.create(:employee_user)
#         sign_in(user, scope: :user)
#         get :index
#       end

#       it 'should render index' do
#         expect(response).to render_template(:index)
#       end

#       it 'should get status 200' do
#         expect(response.status).to eq 200
#       end
#     end

#     context 'when User is not Signed-in' do
#       before do
#         get :index
#       end

#       it 'should render Sign-in page' do
#         expect(subject).to redirect_to(new_user_session_path)
#       end
#     end
#   end
# end