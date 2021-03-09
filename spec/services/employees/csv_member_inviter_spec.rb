# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employees::CsvMemberInviter, type: :controller do
  let!(:source) { fixture_file_upload('files/employees.csv', 'text/csv') }
  let!(:props) { [:email, :first_name, :last_name, :role].freeze }
  let!(:company) { FactoryBot.create(:company) }

  before do
    @members = Employees::CsvMemberInviter.call(source, props, company)
  end

  it 'should return list of Employees created from csv-source' do
    expect(@members.size).to eq(2)
  end

  it 'should store all valid Employees to DB' do
    expect(User.find_by(email: 'qwerty@tut.by')).not_to be_nil
    expect(User.find_by(email: 'mm@tut.by')).not_to be_nil
  end

  it 'should add new Employees to Company' do
    user = User.find_by(email: 'qwerty@tut.by')
    expect(user.company_user.company).to eq(company)
  end
end
