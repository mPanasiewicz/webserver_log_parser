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
          most_uniq_pages: {
            '/index' => 23, '/home' => 23, '/contact' => 23, '/help_page/1' => 23, '/about/2' => 22, '/about' => 21
          }
        }
      end

      context 'when counting all amount of urls' do
        before(:each) do
          allow(UrlsCounterService).to receive(:call).and_return(
            {
              '/help_page/1' => 80, '/contact' => 89, '/home' => 78, '/about/2' => 90, '/index' => 82, '/about' => 81
            }
          )
          allow(UrlsSorterService).to receive(:call).and_return([['/about/2', 90], ['/contact', 89], ['/index', 82],
                                                                 ['/about', 81], ['/help_page/1', 80], ['/home', 78]])
        end

        it 'returns urls amount in descending order' do
          expect(parser[:most_viewed_pages]).to eq(result[:most_viewed_pages])
        end
      end

      context 'when counting uniq amount of urls visited' do
        before(:each) do
          allow(UrlsCounterService).to receive(:call).and_return(
            { '/help_page/1' => 23, '/contact' => 23, '/home' => 23, '/about/2' => 22, '/index' => 23, '/about' => 21 }
          )
          allow(UrlsSorterService).to receive(:call)
            .and_return([['/index', 23], ['/home', 23], ['/contact', 23],
                         ['/help_page/1', 23], ['/about/2', 22], ['/about', 21]])
        end

        it 'returns amount of uniq urls' do
          expect(parser[:most_uniq_pages]).to eq(result[:most_uniq_pages])
        end
      end
    end
  end
end
