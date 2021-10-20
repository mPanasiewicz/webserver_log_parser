# frozen_string_literal: true

require 'pry'

class Parser
  def self.parse(file_path)
    new.parse(file_path)
  end

  def parse(file_path)
    urls = []
    file = File.open(file_path)
    file.readlines.each do |line|
      urls << line.split(' ')[0]
    end
    file.close
    { most_viewed_pages: count_and_sort_pages(urls) }
  end

  private

  def count_and_sort_pages(urls)
    urls.tally
        .sort_by { |_key, value| value }
        .reverse
        .to_h
  end
end
