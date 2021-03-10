# frozen_string_literal: true

module Employees
  class CsvParser < ApplicationService
    attr_reader :attachment, :company, :approved_users

    USER_PROPS = %i[email first_name last_name role phone].freeze

    def initialize(attachment, company)
      super()
      @attachment = attachment
      @company = company
      @approved_users = []
    end

    def call
      CSV.foreach(attachment, headers: true, header_converters: :symbol, col_sep: ';') do |row|
        columns ||= row.headers.intersection(USER_PROPS)
        params = {}
        columns.each { |name| params[name.to_s] = row[name] }
        user = invite_employee(params, company)
        @approved_users << user if user
      end
    end

    private

    def invite_employee(params, company)
      Employees::MemberCreator.call(params, company)
    rescue ActiveRecord::ActiveRecordError
      nil
    end
  end
end
