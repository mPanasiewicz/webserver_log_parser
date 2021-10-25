# frozen_string_literal: true

class UrlsSorterService
  def self.call(urls)
    urls.sort_by { |_key, value| value }
        .reverse!
  end
end
