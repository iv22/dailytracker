# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employees::MemberCreator, type: :controller do
  let(:params) { user_params }
  let(:company) { FactoryBot.create(:company) }

  context 'positive scenario' do
    before do
      @member = Employees::MemberCreator.call(params, company)
    end

    it 'should create new Employee from params' do
      expect(user_fields(@member)).to include(params)
    end

    it 'should add new Employee to Company' do
      expect(@member.company_user.company).to eq(company)
    end
  end
end
