# frozen_string_literal: true

module Employees
  class CsvMemberInviter < ApplicationService
    attr_reader :attachment, :user_props, :company, :approved_users

    def initialize(attachment, user_props, company)
      super()
      @attachment = attachment
      @user_props = user_props
      @company = company
      @approved_users = []
    end

    def call
      CSV.foreach(attachment, headers: true, header_converters: :symbol, col_sep: ';') do |row|
        columns ||= row.headers.intersection(user_props)
        params = {}
        columns.each { |name| params[name.to_s] = row[name] }
        user = invite_employee(params, company)
        @approved_users << user if user
      end
    end

    private

    def invite_employee(params, company)
      Employees::MemberCreator.call(params, company)
    rescue ActiveRecord::StatementInvalid
      nil
    end
  end
end
