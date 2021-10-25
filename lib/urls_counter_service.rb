# frozen_string_literal: true

class UrlsCounterService
  def self.call(urls)
    urls_amount = {}

    urls.each do |url, addr|
      urls_amount[url] = block_given? ? yield(addr).length : addr.length
    end

    urls_amount
  end
end
