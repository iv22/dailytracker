# frozen_string_literal: true

module Employees
  class UploadingAssistant < ApplicationService
    attr_reader :attachment, :company, :controller

    def initialize(attachment, company, controller)
      super()
      @attachment = attachment
      @company = company
      @controller = controller
    end

    def call
      if attachment.blank?
        controller.respond_to { |format| format.json { controller.head :no_content } }
      elsif CsvHeadersValidator.call(attachment)
        run_import
        controller.render json: { message: I18n.t('employees.upload.started') }, status: :accepted
      else
        controller.render json: { message: I18n.t('employees.upload.invalid_headers') }, status: :not_acceptable
      end
    end

    private

    def run_import
      Delayed::Job.enqueue ImportEmployeesWorker.new(attachment, company)
    end
  end
end
