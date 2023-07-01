# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

require "simplecov"
require "simplecov-cobertura"

module SimpleCovEnv
  extend self

  def start!
    configure_formatter
    configure_filters
    write_coverage_percentage

    SimpleCov.start do
      groups.clear
    end
    configure_profile
  end

  private

  def configure_filters
    SimpleCov.configure do
      add_filter "spec/"
      add_filter ".github/"
      add_filter "lib/generators/templates/"
      add_filter "lib/rails_bootstrap_form/version"
      add_filter "demo"
    end
  end

  def configure_profile
    SimpleCov.configure do
      add_group "Inputs", "lib/rails_bootstrap_form/inputs"
      add_group "Helpers", "lib/rails_bootstrap_form/helpers"
    end
  end

  def configure_formatter
    SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
      [
        SimpleCov::Formatter::SimpleFormatter,
        SimpleCov::Formatter::HTMLFormatter,
      ]
    )
  end

  def write_coverage_percentage
    SimpleCov.at_exit do
      File.open(File.join(SimpleCov.coverage_path, "coverage_percent.txt"), "w") do |f|
        f.write SimpleCov.result.covered_percent
      end
      SimpleCov.result.format!
    end
  end
end
