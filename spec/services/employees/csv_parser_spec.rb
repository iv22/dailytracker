# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employees::CsvParser, type: :controller do
  let!(:source) { fixture_file_upload('files/employees.csv', 'text/csv') }
  let!(:props) { %i[email first_name last_name role phone].freeze }
  let!(:company) { FactoryBot.create(:company) }

  before do
    @message = Employees::CsvParser.call(source, company)
  end

  it 'should store all valid Employees to DB' do
    attributes = []
    User.all.select(:email, :first_name, :last_name, :role, :phone).each do |u|
      attributes << u.attributes.symbolize_keys
    end

    expect(attributes).to eq(
      [
        { id: nil, email: 'qwerty@tut.by', first_name: 'Ivan', last_name: 'Ivanov', role: 'employee', phone: nil },
        { id: nil, email: 'mm@tut.by', first_name: 'Mike', last_name: 'Miller', role: 'manager',
          phone: '+375294967365' }
      ]
    )
  end

  it 'should add new Employees to Company' do
    user = User.find_by(email: 'qwerty@tut.by')
    expect(user.company_user.company).to eq(company)
  end

  it "should return 'upload.started' message" do
    @message = I18n.t('employees.upload.started')
  end
end
