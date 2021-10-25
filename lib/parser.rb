# frozen_string_literal: true

require_relative './urls_counter_service'
require_relative './urls_sorter_service'

class Parser
  def self.parse(file_path)
    new.parse(file_path)
  end

  def parse(file_path)
    raise 'Your file is empty! Nothing to parse' if File.empty?(file_path)

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
