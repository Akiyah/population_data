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
      param[:ranges].each do |range|
        @data[range[:year]] = reader.read(range[:sheet], range[:rows], range[:columns])
      end
    end
  end

  def write(path)
    CSV.open(path, 'w', col_sep: "\t") do |tsv|
      tsv << %w[year age male female]
      @data.each do |year, one_year_data|
        one_year_data.each_with_index do |count, i|
          tsv << [year, i, count[0], count[1]]
        end
      end
    end
  end
end
