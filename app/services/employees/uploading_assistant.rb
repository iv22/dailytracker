# frozen_string_literal: true

module Employees
  class UploadingAssistant < ApplicationService
    attr_reader :attachment, :company

    def initialize(attachment, company)
      super()
      @attachment = attachment
      @company = company
    end

    def call
      if Employees::CsvHeadersValidator.call(attachment)
        run_import
        { message: I18n.t('employees.upload.started'), status: :accepted }
      else
        { message: I18n.t('employees.upload.invalid_headers'), status: :not_acceptable }
      end
    end

    private

    def run_import
      Delayed::Job.enqueue ImportEmployeesWorker.new(attachment, company)
    end
  end
end
