# frozen_string_literal: true

require_relative '../lib/urls_counter_service'

RSpec.describe UrlsCounterService do
  describe '#call' do
    context 'without uniqueness' do
      subject(:counter) { UrlsCounterService.call(urls) }

      let(:urls) do
        {
          '/index' => %w[1.1.1.1 1.2.2.2 1.3.3.3 1.1.1.1 1.2.2.2 1.1.1.1],
          '/index/1' => %w[1.1.1.1 1.2.2.2 1.3.3.3 1.1.1.1 1.2.2.2 1.1.1.1 1.2.3.4 1.2.3.4.5]
        }
      end

      it 'returns the number of occurrences of url' do
        expect(counter).to eq({ '/index' => 6, '/index/1' => 8 })
      end
    end

    context 'with uniqueness' do
      subject(:counter) { UrlsCounterService.call(urls, &:uniq) }

      let(:urls) do
        {
          '/index' => %w[1.1.1.1 1.2.2.2 1.3.3.3 1.1.1.1 1.2.2.2 1.1.1.1],
          '/index/1' => %w[1.1.1.1 1.2.2.2 1.3.3.3 1.1.1.1 1.2.2.2 1.1.1.1 1.2.3.4 1.2.3.4.5]
        }
      end

      it 'returns the number of occurrences of url' do
        expect(counter).to eq({ '/index' => 3, '/index/1' => 5 })
      end
    end
  end
end
