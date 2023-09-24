# frozen_string_literal: true

require "test_helper"

class TestColorizeLogs < Minitest::Test
  def test_log_message_become_red
    String.any_instance.expects(:red).once

    formatter.call("INFO", Time.now, "test", "Processing by")
  end

  def test_log_message_become_green
    String.any_instance.expects(:green).once

    formatter.call("INFO", Time.now, "test", "Rendering layout")
  end

  def test_log_message_become_blue
    String.any_instance.expects(:blue).once

    formatter.call("INFO", Time.now, "test", "Rendering some view page within layouts")
  end

  def formatter
    colorize_logs_formatter = ::ColorizeLogs::Formatter.new

    colorize_logs_formatter.configure do
      match(/Processing by/) do |msg, _matches|
        msg.red
      end

      match(/Rendering layout/) do |msg, _matches|
        msg.green
      end

      match(/Rendering.*within layouts/) do |msg, _matches|
        msg.blue
      end
    end
  end
end
