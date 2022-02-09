# frozen_string_literal: true

require './lib/population_data'
require './lib/params'

Dir.mkdir('tsv') unless Dir.exist?('tsv')
Dir.mkdir('download') unless Dir.exist?('download')
Dir.mkdir('download/xls') unless Dir.exist?('download/xls')

population_data = PopulationData.new
population_data.read('download/xls', PARAMS)
population_data.write('tsv/population_data.tsv')
