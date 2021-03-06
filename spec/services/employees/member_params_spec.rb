# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employees::MemberParams, type: :controller do
  it "should raise ArgumentError for invalid 'role' param" do
    invalid_params = ActionController::Parameters.new({ member: { role: 'admin' } })
    expect { Employees::MemberParams.call(invalid_params) }.to raise_error(ArgumentError)
  end
end
