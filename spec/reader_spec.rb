# frozen_string_literal: true

require './lib/reader'

RSpec.describe Reader do
  context '#read' do
    let(:filename) { 'spec/download/xls/name.xlsx' }
    let(:reader) { Reader.new(filename) }

    context 'A1' do
      let(:expected) do
        [
          %w[1-B2 1-C2],
          %w[1-B3 1-C3],
          %w[1-B4 1-C4]
        ]
      end

      it do
        expect(reader.read('Sheet1', [2, 3, 4], %w[B C])).to eq expected
      end
    end
  end
end
