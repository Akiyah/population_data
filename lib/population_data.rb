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
        reader.read(range[:sheet], range[:rows], range[:columns])
      end
    end
  end
end
