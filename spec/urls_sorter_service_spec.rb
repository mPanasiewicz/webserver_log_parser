# frozen_string_literal: true

require_relative '../lib/urls_sorter_service'

RSpec.describe UrlsSorterService do
  describe '#call' do
    subject(:sorter) { UrlsSorterService.call(urls) }

    let(:urls) do
      {
        '/index' => 6,
        '/index/1' => 8,
        '/home' => 2,
        '/home/1' => 4,
        '/about' => 100
      }
    end

    it 'returns sorted number of occurrences of url' do
      expect(sorter).to eq([['/about', 100], ['/index/1', 8], ['/index', 6], ['/home/1', 4], ['/home', 2]])
    end
  end
end
