# frozen_string_literal: true

require "test_helper"

class TestColorizeLogs < Minitest::Test
  def test_log_message_becomes_red
    String.any_instance.expects(:red).once

    formatter.call("INFO", Time.now, "test", "Processing by")
  end

  def test_log_message_becomes_green
    String.any_instance.expects(:green).once

    formatter.call("INFO", Time.now, "test", "Rendering layout")
  end

  def test_log_message_becomes_blue
    String.any_instance.expects(:blue).once

    formatter.call("INFO", Time.now, "test", "Rendering some view page within layouts")
  end

  def test_log_message_fails_to_become_blue
    String.any_instance.expects(:blue).never

    formatter.call("INFO", Time.now, "test", "some other message")
  end

  def formatter
    colorize_logs_formatter = ::ColorizeLogs::Formatter.new

    colorize_logs_formatter.configure do
      match(/Processing by/, &:red)

      match(/Rendering layout/, &:green)

      match(/Rendering.*within layouts/, &:blue)
    end
  end
end
