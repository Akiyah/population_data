# frozen_string_literal: true

require './lib/csv_wrapper'

RSpec.describe CsvWrapper do
  let(:filename) { 'spec/download/xls/name.xlsx' }
  let(:csv_wrapper) { CsvWrapper.new(filename) }

  context '#read' do
    context 'xlsx' do
      let(:filename) { 'spec/download/xls/name.xlsx' }

      it do
        expect(csv_wrapper.read('Sheet1', 1, 'A')).to eq '1-A1'
        expect(csv_wrapper.read('Sheet1', 3, 'B')).to eq '1-B3'
        expect(csv_wrapper.read('Sheet1', 2, 'C')).to eq '1-C2'
        expect(csv_wrapper.read('Sheet2', 1, 'A')).to eq '2-A1'
        expect(csv_wrapper.read('Sheet2', 3, 'B')).to eq '2-B3'
        expect(csv_wrapper.read('Sheet2', 2, 'C')).to eq '2-C2'
      end
    end

    context 'xls' do
      let(:filename) { 'spec/download/xls/name.xls' }

      it do
        expect(csv_wrapper.read('Sheet1', 1, 'A')).to eq '1-A1'
        expect(csv_wrapper.read('Sheet1', 3, 'B')).to eq '1-B3'
        expect(csv_wrapper.read('Sheet1', 2, 'C')).to eq '1-C2'
        expect(csv_wrapper.read('Sheet2', 1, 'A')).to eq '2-A1'
        expect(csv_wrapper.read('Sheet2', 3, 'B')).to eq '2-B3'
        expect(csv_wrapper.read('Sheet2', 2, 'C')).to eq '2-C2'
      end
    end
  end

  context '#row_index' do
    it do
      expect(csv_wrapper.row_index(1)).to eq 0
      expect(csv_wrapper.row_index(2)).to eq 1
      expect(csv_wrapper.row_index(3)).to eq 2
    end
  end

  context '#column_index' do
    context 'column is String' do
      it do
        expect(csv_wrapper.column_index('A')).to eq 0
        expect(csv_wrapper.column_index('B')).to eq 1
        expect(csv_wrapper.column_index('C')).to eq 2

        expect(csv_wrapper.column_index('Z')).to eq 25
        expect(csv_wrapper.column_index('AA')).to eq((26 * 1) + 0)
        expect(csv_wrapper.column_index('AB')).to eq((26 * 1) + 1)

        expect(csv_wrapper.column_index('AZ')).to eq((26 * 1) + 25)
        expect(csv_wrapper.column_index('BA')).to eq((26 * 2) + 0)
        expect(csv_wrapper.column_index('BB')).to eq((26 * 2) + 1)

        expect(csv_wrapper.column_index('ZZ')).to eq((26 * 26) + 25)
        expect(csv_wrapper.column_index('AAA')).to eq((26 * 26 * 1) + (26 * 1) + 0)
        expect(csv_wrapper.column_index('AAB')).to eq((26 * 26 * 1) + (26 * 1) + 1)
      end

      it do
        expect(csv_wrapper.column_index('A')).to eq 0
        expect(csv_wrapper.column_index('B')).to eq 1
        expect(csv_wrapper.column_index('C')).to eq 2

        expect(csv_wrapper.column_index('Z')).to eq 25
        expect(csv_wrapper.column_index('AA')).to eq 26
        expect(csv_wrapper.column_index('AB')).to eq 27

        expect(csv_wrapper.column_index('AZ')).to eq 51
        expect(csv_wrapper.column_index('BA')).to eq 52
        expect(csv_wrapper.column_index('BB')).to eq 53

        expect(csv_wrapper.column_index('ZZ')).to eq 701
        expect(csv_wrapper.column_index('AAA')).to eq 702
        expect(csv_wrapper.column_index('AAB')).to eq 703
      end
    end

    context 'column is Integer' do
      it do
        expect(csv_wrapper.column_index(1)).to eq 0
        expect(csv_wrapper.column_index(2)).to eq 1
        expect(csv_wrapper.column_index(3)).to eq 2
      end
    end
  end
end
