# frozen_string_literal: true

require 'pry'

class Parser
  def self.parse(file_path)
    new.parse(file_path)
  end

  def parse(file_path)
    urls = Hash.new { |hash, key| hash[key] = [] }

    file = File.open(file_path)
    file.readlines.each do |line|
      splited_line = line.split(' ')
      urls[splited_line[0]] << splited_line[1]
    end
    file.close
    # { most_viewed_pages: count_and_sort_pages(urls) }
    {
      most_viewed_pages: count_and_sort_pages(urls),
      most_uniq_pages: count_and_sort_uniq_pages(urls)
    }
  end

  private

  def count_and_sort_pages(urls)
    urls_amount = {}
    urls.each do |url, addr|
      urls_amount[url] = addr.length
    end
    urls_amount.sort_by { |_key, value| value }
               .reverse
               .to_h
  end

  def count_and_sort_uniq_pages(_urls)
    {}
  end
end
