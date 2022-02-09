# frozen_string_literal: true

require 'roo'
require 'roo-xls'

class CsvWrapper
  def initialize(filename)
    @excel = if filename.end_with?('xlsx')
               Roo::Excelx.new(filename)
             else
               Roo::Excel.new(filename)
             end

    @csv_data = {}
  end

  def read(sheet, row, column)
    @csv_data[sheet] ||= CSV.parse(@excel.sheet(sheet).to_csv)
    @csv_data[sheet][row_index(row)][column_index(column)]
  end

  def row_index(row)
    row - 1
  end

  def column_index(column)
    index = 0
    column.chars.reverse.each_with_index do |char, i|
      j = ('A'..'Z').to_a.index(char)
      index += (i.zero? ? j : (j + 1) * (26**i))
    end
    index
  end
end
