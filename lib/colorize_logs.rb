# frozen_string_literal: true

require_relative "colorize_logs/version"
require_relative "colorize_logs/formatter"

module ColorizeLogs
  class Error < StandardError; end

  def self.configure(formatter = nil, &block)
    formatter = Formatter.new unless formatter.is_a? Formatter
    formatter.configure(&block)
  end
end
