# frozen_string_literal: true

ImportEmployeesWorker = Struct.new(:attachment, :company) do
  def perform
    Employees::CsvParser.call(attachment, company)
  end
end
