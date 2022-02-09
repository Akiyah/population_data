# frozen_string_literal: true

require './lib/csv_wrapper'

RSpec.describe CsvWrapper do
  context '#read' do
    context 'xlsx' do
      let(:filename) { 'spec/download/xls/name.xlsx' }

      it do
        csv_wrapper = CsvWrapper.new(filename)

        expect(csv_wrapper.read('Sheet1', 1, 'A')).to eq '1-A1'
        expect(csv_wrapper.read('Sheet1', 2, 'B')).to eq '1-B2'
        expect(csv_wrapper.read('Sheet1', 3, 'C')).to eq '1-C3'
        expect(csv_wrapper.read('Sheet2', 1, 'A')).to eq '2-A1'
        expect(csv_wrapper.read('Sheet2', 2, 'B')).to eq '2-B2'
        expect(csv_wrapper.read('Sheet2', 3, 'C')).to eq '2-C3'
      end
    end

    context 'xls' do
      let(:filename) { 'spec/download/xls/name.xls' }

      it do
        csv_wrapper = CsvWrapper.new(filename)

        expect(csv_wrapper.read('Sheet1', 1, 'A')).to eq '1-A1'
        expect(csv_wrapper.read('Sheet1', 2, 'B')).to eq '1-B2'
        expect(csv_wrapper.read('Sheet1', 3, 'C')).to eq '1-C3'
        expect(csv_wrapper.read('Sheet2', 1, 'A')).to eq '2-A1'
        expect(csv_wrapper.read('Sheet2', 2, 'B')).to eq '2-B2'
        expect(csv_wrapper.read('Sheet2', 3, 'C')).to eq '2-C3'
      end
    end
  end
end
