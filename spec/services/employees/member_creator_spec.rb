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

  context 'negative scenario' do
    def execute_ddl(ddl)
      ActiveRecord::Base.connection.execute(ddl)
    end

    def simulate_db_trouble
      execute_ddl 'ALTER TABLE company_users ADD COLUMN breaker integer NOT NULL;'
    end

    def undo_db_trouble
      execute_ddl 'ALTER TABLE company_users DROP COLUMN IF EXISTS breaker;'
    end

    before(:all) do
      undo_db_trouble
      simulate_db_trouble
    end

    after(:all) do
      undo_db_trouble
    end

    it 'should raise error and should not add an Employee' do
      expect { Employees::MemberCreator.call(params, company) }.to raise_error(Exception)
      expect(User.find_by(email: params[:email])).to be_nil
    end
  end
end
