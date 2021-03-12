# frozen_string_literal: true

module Employees
  module Props
    USER = %i[email first_name last_name role phone].freeze
    OPTIONAL_USER = %i[phone].freeze
    REQUIRED_USER = USER - OPTIONAL_USER

    CSV_OPTIONS = { headers: true, header_converters: :symbol, col_sep: ';' }.freeze
  end
end
