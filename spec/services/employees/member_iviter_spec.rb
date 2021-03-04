# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employees::MemberInviter, type: :controller do
  let(:params) { user_fields(FactoryBot.create(:employee_user)) }

  it "should call 'invite!' method on model User" do
    expect(User).to receive(:invite!)
    Employees::MemberInviter.call(params)
  end

  it "should return valid User object with ID" do
    object = Employees::MemberInviter.call(params)
    expect(object.class).to eq(User)
    expect(object.id).to be > 0
    expect(user_fields(object)).to include(params)
  end
end
