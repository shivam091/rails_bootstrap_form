# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

ENV["RAILS_ENV"] ||= "test"

require_relative "../demo/config/environment"
require "simplecov"

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |file| require file }

def spec_root
  Pathname.new(File.expand_path(__dir__))
end

def test_directory_path
  spec_root / "test"
end

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.order = "default"

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include ActionView::Helpers::FormHelper
  config.include ActionView::Context if defined?(ActionView::Context)

  config.before(:suite) do
    FileUtils.mkdir_p(test_directory_path)
  end

  config.after(:suite) do
    FileUtils.rm_rf(test_directory_path)
  end
end
