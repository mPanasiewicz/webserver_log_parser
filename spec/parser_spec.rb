# frozen_string_literal: true

require_relative '../lib/parser'

RSpec.describe Parser do
  describe '#parse' do
    subject(:parser) { Parser.parse(file) }

    context 'when the file is not empty' do
      let(:file) { '/Users/maciejpanasiewicz/Downloads/SP Ruby Test/ruby_app/webserver.log' }
      let(:most_viewed_pages) do
        { most_viewed_pages: { '/about/2' => 90, '/contact' => 89, '/index' => 82, '/about' => 81,
                               '/help_page/1' => 80, '/home' => 78 } }
      end

      it 'returns top 10 urls amount' do
        expect(parser).to eq(most_viewed_pages)
      end
    end
  end
end
