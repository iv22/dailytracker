# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employees::MemberParams, type: :controller do
  let(:params) do
    request_params = { member: {
      email: 'ok@mail.ru',
      first_name: 'Weast',
      last_name: 'Dow',
      address: 'Street',
      role: 'employee'
    }, manager: {
      height: 180,
      weight: 80
    } }
    ActionController::Parameters.new(request_params)
  end

  it 'should require and permit needed params' do
    expected_params = params.require('member').permit(:email, :first_name, :last_name, :role)
    expect(Employees::MemberParams.call(params)).to eq(expected_params)
  end

  it "should raise ArgumentError for invalid 'role' param" do
    invalid_params = ActionController::Parameters.new({ member: { role: 'admin' } })
    expect { Employees::MemberParams.call(invalid_params) }.to raise_error(ArgumentError)
  end
end
