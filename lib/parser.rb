# frozen_string_literal: true

require 'pry'

class Parser
  def self.parse(file_path)
    new.parse(file_path)
  end

  def parse(file_path)
    urls = Hash.new { |hash, key| hash[key] = [] }

    File.foreach(file_path) do |line|
      splited_line = line.split(' ')
      urls[splited_line[0]] << splited_line[1]
    end
    process_urls(urls)
  end

  private

  def process_urls(urls)
    {
      most_viewed_pages: count_and_sort_urls(urls),
      most_uniq_pages: count_and_sort_urls(urls, &:uniq)
    }
  end

  def count_and_sort_urls(urls, &block)
    UrlsSorterService.call(UrlsCounterService.call(urls, &block)).to_h
  end
end

class UrlsCounterService
  def self.call(urls)
    urls_amount = {}

    urls.each do |url, addr|
      urls_amount[url] = block_given? ? yield(addr).length : addr.length
    end

    urls_amount
  end
end

class UrlsSorterService
  def self.call(urls)
    urls.sort_by { |_key, value| value }
        .reverse!
  end
end
