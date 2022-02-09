# frozen_string_literal: true

require './lib/csv_wrapper'

class Reader
  def initialize(filename)
    @csv_wrapper = CsvWrapper.new(filename)
  end

  def read(sheet, rows, columns)
    rows.map do |row|
      columns.map do |column|
        @csv_wrapper.read(sheet, row, column)
      end
    end
  end
end
