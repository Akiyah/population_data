# frozen_string_literal: true

require 'csv'
require './lib/downloader'

class PopulationData
  def initialize
    @data = {}
  end

  def read(path_xls, params)
    downloader = Downloader.new(path_xls)
    params.each do |param|
      downloader.download(param[:name], param[:excel_url])
    end
  end
end
