# frozen_string_literal: true

require './lib/population_data'

RSpec.describe PopulationData do
  let(:data) { PopulationData.new }
  let(:path_xls) { 'spec/download/xls' }
  let(:filename) { 'spec/download/xls/name.xlsx' }
  let(:params) do
    [
      { name: 'name1', excel_url: 'excel_url1', ranges: [
        { sheet: 'Sheet1', year: 1920, rows: [2, 3, 4], columns: %w[B C] }
      ] },
      { name: 'name2', excel_url: 'excel_url2', ranges: [
        { sheet: 'Sheet2', year: 2000, rows: [3, 4, 5], columns: %w[C D] }
      ] }
    ]
  end
  let(:downloader) { instance_double(Downloader) }
  let(:reader) { instance_double(Reader) }

  before do
    allow(Downloader).to receive(:new).and_return(downloader)
    allow(downloader).to receive(:download).and_return(filename)

    allow(Reader).to receive(:new).with(filename).and_return(reader)
    allow(reader).to receive(:read)
  end

  context '#read' do
    it do
      expect(downloader).to receive(:download).with('name1', 'excel_url1')
      expect(downloader).to receive(:download).with('name2', 'excel_url2')

      expect(reader).to receive(:read).with('Sheet1', [2, 3, 4], %w[B C])
      expect(reader).to receive(:read).with('Sheet2', [3, 4, 5], %w[C D])

      data.read(path_xls, params)
    end
  end
end
