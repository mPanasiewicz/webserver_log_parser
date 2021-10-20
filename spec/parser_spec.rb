# frozen_string_literal: true

require_relative '../lib/parser'

RSpec.describe Parser do
  describe '#parse' do
    subject(:parser) { Parser.parse(file) }

    context 'when the file is not empty' do
      let(:file) { './fixtures/webserver.log' }

      it 'returns top 10 urls amount' do
        expect(subject).to be_truthy
      end
    end
  end
end
