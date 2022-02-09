# frozen_string_literal: true

require './lib/population_data'

RSpec.describe PopulationData do
  let(:population_data) { PopulationData.new }
  let(:path_xls) { 'spec/download/xls' }
  let(:filename) { 'spec/download/xls/name.xlsx' }
  let(:params) do
    [
      { name: 'name1', excel_url: 'excel_url1', ranges: [
        { sheet: 'Sheet1', year: 1920, rows: [2, 3, 4], columns: %w[B C] }
      ] },
      { name: 'name2', excel_url: 'excel_url2', ranges: [
        { sheet: 'Sheet2', year: 2000, rows: [3, 4, 5], columns: %w[C D] },
        { sheet: 'Sheet3', year: 2001, rows: [6, 7, 8], columns: %w[D E] }
      ] }
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
      expect(reader).to receive(:read).with('Sheet3', [6, 7, 8], %w[D E])

      population_data.read(path_xls, params)

      expect(population_data.instance_variable_get(:@data)).to eq({ 1920 => 'data1', 2000 => 'data2', 2001 => 'data3' })
    end
  end

  context '#write' do
    let(:data) do
      {
        1920 => [[11, 12], [13, 14], [15, 16]],
        2000 => [[21, 22], [23, 24], [25, 26]],
        2001 => [[31, 32], [33, 34], [35, 36]]
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
end
