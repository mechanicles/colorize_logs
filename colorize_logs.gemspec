# frozen_string_literal: true

require_relative "lib/colorize_logs/version"

Gem::Specification.new do |spec|
  spec.name = "colorize_logs"
  spec.version = ColorizeLogs::VERSION
  spec.summary = "Colorize your Rails logs"
  spec.homepage = "https://github.com/mechanicles/colorize_logs"
  spec.license = "MIT"

  spec.authors = ["Santosh Wadghule"]
  spec.email = ["santosh.wadghule@gmail.com"]

  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir["*.{md,txt}", "{lib}/**/*"]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activesupport"
  spec.add_dependency "colorize"
end
