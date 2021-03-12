# frozen_string_literal: true

module Employees
  class CsvHeadersValidator < ApplicationService
    attr_reader :attachment

    def initialize(attachment)
      super()
      @attachment = attachment
    end

    def call
      valid_headers = false

      CSV.foreach(attachment, **Csv::Utils.options) do |row|
        valid_headers = (User.required_props - row.headers).empty?
        break
      end

      valid_headers
    rescue CSV::MalformedCSVError
      false
    end
  end
end
