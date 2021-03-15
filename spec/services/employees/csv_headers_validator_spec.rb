# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employees::CsvHeadersValidator, type: :controller do
  let!(:valid_source) { fixture_file_upload('files/employees.csv', 'text/csv') }
  let!(:malformed_source) { fixture_file_upload('files/malformed_employees.csv', 'text/csv') }
  let!(:incorrect_headers_source) { fixture_file_upload('files/incorrect_headers_employees.csv', 'text/csv') }

  it "should return 'true' for valid source" do
    expect(Employees::CsvHeadersValidator.call(valid_source)).to be true
  end

  it "should return 'false' for malformed source" do
    expect(Employees::CsvHeadersValidator.call(malformed_source)).to be false
  end

  it "should return 'false' for incorrect headers source" do
    expect(Employees::CsvHeadersValidator.call(incorrect_headers_source)).to be false
  end
end
