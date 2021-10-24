# frozen_string_literal: true

require_relative '../lib/parser'

RSpec.describe Parser do
  describe '#parse' do
    subject(:parser) { Parser.parse(file) }

    context 'when the file is not empty' do
      let(:file) { '/Users/maciejpanasiewicz/Downloads/SP Ruby Test/ruby_app/webserver.log' }
      let(:result) do
        {
          most_viewed_pages: { '/about/2' => 90, '/contact' => 89, '/index' => 82, '/about' => 81,
                               '/help_page/1' => 80, '/home' => 78 },
          most_uniq_pages: {}
        }
      end

      it 'returns urls amount in descending order' do
        expect(parser[:most_viewed_pages]).to eq(result[:most_viewed_pages])
      end

      it 'returns amount of uniq urls' do
        expect(parser[:most_uniq_pages]).to eq({})
      end
    end
  end
end
