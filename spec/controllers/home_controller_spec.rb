# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'when User is Signed-in' do
      before do
        user = FactoryBot.create(:employee_user)
        sign_in(user, scope: :user)
        get :index
      end

      it 'should render index' do
        expect(response).to render_template(:index)
      end
    end

    context 'when User is not Signed-in' do
      before do
        get :index
      end

      it 'should render Sign-in page' do
        expect(subject).to redirect_to(new_user_session_path)
      end
    end
  end
end
