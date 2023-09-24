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

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end

  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activesupport"
  spec.add_dependency "colorize"
end
