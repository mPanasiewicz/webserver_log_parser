# frozen_string_literal: true

require_relative '../lib/parser'

RSpec.describe Parser do
  describe '#parse' do
    subject(:parser) { Parser.parse(file) }

    context 'when the file is not empty' do
      let(:file) { '/Users/maciejpanasiewicz/Downloads/SP Ruby Test/ruby_app/webserver.log' }

      it 'returns top 10 urls amount' do
        expect(parser).to eq('/help_page/1' => 80)
      end
    end
  end
end
