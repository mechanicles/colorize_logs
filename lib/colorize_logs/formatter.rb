# frozen_string_literal: true

require "active_support/tagged_logging"
require "colorize"

module ColorizeLogs
  # Custom formatter for Rails logger
  class Formatter < ActiveSupport::Logger::SimpleFormatter
    include ActiveSupport::TaggedLogging::Formatter

    def initialize
      super

      @matchers = {}
    end

    def configure(&block)
      instance_eval(&block)
      self
    end

    def call(severity, time, progname, msg)
      return if msg.blank?

      msg = colorize_message(msg)

      super(severity, time, progname, msg)
    end

    private

    def colorize_message(msg)
      msg = msg.is_a?(String) ? msg : msg.inspect

      proc = find_matching_pattern(msg)

      proc ? proc.call(msg) : msg
    end

    def find_matching_pattern(msg)
      matcher = @matchers.find { |pattern, _| pattern.match(msg) }

      matcher&.last
    end

    def match(pattern, proc = nil, &block)
      proc ||= block
      @matchers[pattern] = proc
      self
    end
  end
end
