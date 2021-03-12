# frozen_string_literal: true

module Employees
  class CsvParser < ApplicationService
    attr_reader :attachment, :company

    def initialize(attachment, company)
      super()
      @attachment = attachment
      @company = company
    end

    def call
      users = []
      company_users = []
      iterate_csv_body do |params|
        user = User.new(params)
        user.password = Devise.friendly_token.first(8)
        users << user
        company_users << CompanyUser.new(company: company, user: user)
      end
      User.import users, on_duplicate_key_ignore: true
      CompanyUser.import company_users
    end

    private

    def iterate_csv_body
      CSV.foreach(attachment, **Employees::Props::CSV_OPTIONS) do |row|
        columns ||= row.headers & Employees::Props::USER
        params = {}
        columns.each { |name| params[name.to_s] = row[name] }
        yield params
      end
    end
  end
end
