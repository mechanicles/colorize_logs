# frozen_string_literal: true

require 'active_support/tagged_logging'
require 'colorize'

module ColorizeLogs
  class Formatter < ::ActiveSupport::Logger::SimpleFormatter
    include ActiveSupport::TaggedLogging::Formatter

    def initialize
      @configuration = { matchers: {} }
    end

    def configure(&block)
      instance_eval(&block)

      self
    end

    def call(severity, time, progname, msg)
      return if msg.blank?

      msg = [
        colorized_message(msg)
      ].compact.join(' ')

      super severity, time, progname, msg
    end

    private

    attr_accessor :configuration

    def colorized_message(msg)
      msg = msg.is_a?(String) ? msg : msg.inspect
      args = matched?(msg)

      return args.first.call msg, args.last if args.present?

      msg
    end

    def match(pattern, proc = nil, &block)
      proc ||= block

      configuration[:matchers][pattern] = proc

      self
    end

    def matched?(msg)
      matched = configuration[:matchers].find { |pattern, _| pattern.match(msg) }

      [matched.last, Regexp.last_match] if matched
    end
  end
end