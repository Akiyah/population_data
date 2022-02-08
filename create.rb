require './lib/population_data.rb'
require './lib/params.rb'

Dir.mkdir('tsv') unless Dir.exist?('tsv')
Dir.mkdir('download') unless Dir.exist?('download')
Dir.mkdir('download/xls') unless Dir.exist?('download/xls')

data = PopulationData.new

data.read('download/xls', PARAAMS)
