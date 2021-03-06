# frozen_string_literal: true

require './lib/population_data'

RSpec.describe PopulationData do
  let(:population_data) { PopulationData.new }
  let(:path_xls) { 'spec/download/xls' }
  let(:filename) { 'spec/download/xls/name.xlsx' }
  let(:params) do
    [
      {
        name: 'name1',
        excel_url: 'excel_url1',
        sheets:
        {
          'Sheet1' => [
            { year: 1920, rows: [2, 3, 4], columns: %w[B C] }
          ]
        }
      }, {
        name: 'name2',
        excel_url: 'excel_url2',
        sheets: {
          'Sheet2' => [
            { year: 2000, rows: [3, 4, 5], columns: %w[C D] },
            { year: 2001, rows: [6, 7, 8], columns: %w[D E] }
          ]
        }
      }
    ]
  end
  let(:downloader) { instance_double(Downloader) }
  let(:reader) { instance_double(Reader) }

  before do
    allow(Downloader).to receive(:new).and_return(downloader)
    allow(downloader).to receive(:download).and_return(filename)

    allow(Reader).to receive(:new).with(filename).and_return(reader)
    allow(reader).to receive(:read).and_return('data1', 'data2', 'data3')
  end

  context '#read' do
    it do
      expect(downloader).to receive(:download).with('name1', 'excel_url1')
      expect(downloader).to receive(:download).with('name2', 'excel_url2')

      expect(reader).to receive(:read).with('Sheet1', [2, 3, 4], %w[B C])
      expect(reader).to receive(:read).with('Sheet2', [3, 4, 5], %w[C D])
      expect(reader).to receive(:read).with('Sheet2', [6, 7, 8], %w[D E])

      population_data.read(path_xls, params)

      expect(population_data.instance_variable_get(:@data)).to eq({ 1920 => 'data1', 2000 => 'data2', 2001 => 'data3' })
    end
  end

  context '#write' do
    let(:data) do
      {
        1920 => [%w[11 12], %w[13 14], %w[15 16]],
        2000 => [%w[21 22], %w[23 24], %w[25 26]],
        2001 => [%w[31 32], %w[33.1 34.9], %w[あいう xxx]]
      }
    end

    let(:path) { 'spec/tsv/population_data.tsv' }
    let(:path_expected) { 'spec/tsv/population_data_expected.tsv' }

    before do
      population_data.instance_variable_set('@data', data)
    end

    it do
      population_data.write(path)

      expect(File.read(path)).to eq File.read(path_expected)
    end
  end

  context '#to_number' do
    it do
      expect(population_data.to_number(123)).to be 123
      expect(population_data.to_number(123.5)).to be 123.5
      expect(population_data.to_number('-')).to be 0
    end
  end
end
