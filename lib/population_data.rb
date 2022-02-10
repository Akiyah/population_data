# frozen_string_literal: true

require 'csv'
require './lib/downloader'
require './lib/reader'

class PopulationData
  def initialize
    @data = {}
  end

  def read(path_xls, params)
    downloader = Downloader.new(path_xls)
    params.each do |param|
      filename = downloader.download(param[:name], param[:excel_url])
      reader = Reader.new(filename)
      param[:sheets].each do |sheet_name, sheet_params|
        sheet_params.each do |sheet_param|
          year = sheet_param[:year]
          rows = sheet_param[:rows]
          columns = sheet_param[:columns]
          @data[year] = reader.read(sheet_name, rows, columns)
        end
      end
    end
  end

  def write(path)
    CSV.open(path, 'w', col_sep: "\t") do |tsv|
      tsv << %w[year age male female]
      @data.each do |year, one_year_data|
        one_year_data.each_with_index do |count, i|
          tsv << [year, i, to_number(count[0]), to_number(count[1])]
        end
      end
    end
  end

  def to_number(str)
    i = str.to_i
    f = str.to_f
    i == f ? i : f
  end
end
