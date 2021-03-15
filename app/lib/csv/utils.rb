# frozen_string_literal: true

module Csv
  class Utils
    def self.options
      { headers: true, header_converters: :symbol, col_sep: ';' }.freeze
    end
  end
end
