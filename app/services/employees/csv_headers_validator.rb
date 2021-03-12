# frozen_string_literal: true

module Employees
  class CsvHeadersValidator < ApplicationService
    attr_reader :attachment

    def initialize(attachment)
      super()
      @attachment = attachment
    end

    def call
      csv_headers = []

      CSV.foreach(attachment, **Employees::Props::CSV_OPTIONS) do |row|
        csv_headers = row.headers
        break
      end

      (Employees::Props::REQUIRED_USER - csv_headers).empty?
    rescue CSV::MalformedCSVError
      false
    end
  end
end
