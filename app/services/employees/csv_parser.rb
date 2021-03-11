# frozen_string_literal: true

module Employees
  class CsvParser < ApplicationService
    attr_reader :attachment, :company

    USER_PROPS = %i[email first_name last_name role phone].freeze
    OPTIONAL_USER_PROPS = %i[phone].freeze

    CSV_OPTIONS = { headers: true, header_converters: :symbol, col_sep: ';' }.freeze

    def initialize(attachment, company)
      super()
      @attachment = attachment
      @company = company
    end

    def call
      if headers_valid?
        delay.import_employees
        I18n.t('employees.upload.started')
      else
        I18n.t('employees.upload.invalid_headers')
      end
    end

    private

    def headers_valid?
      csv_headers = []

      CSV.foreach(attachment, **CSV_OPTIONS) do |row|
        csv_headers = row.headers
        break
      end

      (USER_PROPS - OPTIONAL_USER_PROPS - csv_headers).empty?
    rescue CSV::MalformedCSVError
      false
    end

    def import_employees
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

    def iterate_csv_body
      CSV.foreach(attachment, **CSV_OPTIONS) do |row|
        columns ||= row.headers & USER_PROPS
        params = {}
        columns.each { |name| params[name.to_s] = row[name] }
        yield params
      end
    end
  end
end
