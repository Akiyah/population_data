# frozen_string_literal: true

require './lib/downloader'

RSpec.describe Downloader do
  let(:downloader) { Downloader.new(path) }
  let(:path) { 'spec/download/xls/xls' }

  let(:name) { 'name' }
  let(:url) { 'url' }

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
      let(:uri) { double('uri') }
      let(:meta) { { 'content-disposition' => content_disposition } }
      let(:content_disposition) { 'name.xls' }
      let(:filename) { 'spec/download/xls/no_file/name.xls' }

      before do
        File.delete(filename) if File.exist?(filename)
        allow(URI).to receive(:parse).with(url).and_return(uri)
        allow(uri).to receive(:open) do |&block|
          block.call(stream)
        end
        allow(stream).to receive(:read).and_return('stream content')
      end

      it do
        expect(downloader.download(name, url)).to eq filename
        expect(File.read(filename)).to eq 'stream content'
      end

      after do
        File.delete(filename) if File.exist?(filename)
      end
    end
  end

  describe '#filename_by_stream' do
    let(:filename_xls) { 'foo/bar/name.xls' }
    let(:filename_xlsx) { 'foo/bar/name.xlsx' }
    let(:stream) { double('stream', meta: meta) }
    let(:meta) { { 'content-disposition' => content_disposition } }

    context 'xls' do
      let(:content_disposition) { 'name.xls' }

      it do
        filename = downloader.filename_by_stream(stream, filename_xls, filename_xlsx)
        expect(filename).to eq filename_xls
      end
    end

    context 'xlsx' do
      let(:content_disposition) { 'name.xlsx' }

      it do
        filename = downloader.filename_by_stream(stream, filename_xls, filename_xlsx)
        expect(filename).to eq filename_xlsx
      end
    end
  end
end
