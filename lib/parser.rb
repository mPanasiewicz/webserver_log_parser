# frozen_string_literal: true

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
    ordered_urls = urls.tally
    ordered_urls.first(1).to_h
  end
end
