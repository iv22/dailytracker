# frozen_string_literal: true

module Employees
  class UploadingAssistant < ApplicationService
    attr_reader :attachment, :company, :no_content, :json_content

    def initialize(attachment, company, no_content, json_content)
      super()
      @attachment = attachment
      @company = company
      @no_content = no_content
      @json_content = json_content
    end

    def call
      if attachment.blank?
        no_content.call
      elsif CsvHeadersValidator.call(attachment)
        run_import
        json_content.call(I18n.t('employees.upload.started'), :accepted)
      else
        json_content.call(I18n.t('employees.upload.invalid_headers'), :not_acceptable)
      end
    end

    private

    def run_import
      Delayed::Job.enqueue ImportEmployeesWorker.new(attachment, company)
    end
  end
end
