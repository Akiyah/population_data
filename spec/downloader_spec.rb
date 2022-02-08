require './lib/downloader'

RSpec.describe Downloader do
  let(:downloader) { Downloader.new(path) }

  let(:name) { 'name' }
  let(:url) { 'url' }

  before do
  end

  describe '#download' do
    context 'xls file exists' do
      let(:path) { 'spec/download/xls/xls' }

      it do
        filename = downloader.download(name, url)
        expect(filename).to eq 'spec/download/xls/xls/name.xls'
      end
    end

    context 'xlsx file exists' do
      let(:path) { 'spec/download/xls/xlsx' }

      it do
        filename = downloader.download(name, url)
        expect(filename).to eq 'spec/download/xls/xlsx/name.xlsx'
      end
    end

    context 'no file exists' do
      let(:path) { 'spec/download/xls/no_file' }
      let(:stream) { double('stream', meta: meta) }
      let(:meta) { { 'content-disposition' => content_disposition } }

      before do
        File.delete(filename) if File.exist?(filename)
        allow(URI).to receive(:open).with(url) do |&block|
          block.call(stream)
        end
        allow(stream).to receive(:read).and_return('stream content')
      end

      after do
        File.delete(filename) if File.exist?(filename)
      end

      context 'xls' do
        let(:content_disposition) { 'name.xls' }
        let(:filename) { 'spec/download/xls/no_file/name.xls' }

        it do
          expect(downloader.download(name, url)).to eq filename
          expect(File.read(filename)).to eq 'stream content'
        end
      end

      context 'xlsx' do
        let(:content_disposition) { 'name.xlsx' }
        let(:filename) { 'spec/download/xls/no_file/name.xlsx' }

        it do
          expect(downloader.download(name, url)).to eq filename
          expect(File.read(filename)).to eq 'stream content'
        end
      end
    end
  end
end
