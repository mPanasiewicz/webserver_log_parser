# frozen_string_literal: true

class Parser
  def self.parse(file_path)
    new.parse(file_path)
  end

  def parse(_file_path)
    true
  end
end
