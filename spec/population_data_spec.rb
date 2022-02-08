require './lib/population_data.rb'

RSpec.describe PopulationData do
  let(:data) { PopulationData.new }
  let(:path_xls) { 'spec/download/xls' }
  let(:params) do
    [
      { name: 'name1', excel_url: 'excel_url1' },
      { name: 'name2', excel_url: 'excel_url2' }
    ]
  end
  let(:downloader) { instance_double(Downloader) }

  before do
    allow(Downloader).to receive(:new).and_return(downloader)
    allow(downloader).to receive(:download)
  end

  context "#read" do
    it do
      expect(downloader).to receive(:download).with('name1', 'excel_url1')
      expect(downloader).to receive(:download).with('name2', 'excel_url2')

      data.read(path_xls, params)
    end
  end
end
