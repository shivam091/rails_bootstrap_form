# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

gems = "#{__dir__}/gemfiles/common.gemfile"
eval File.read(gems), binding, gems

require "#{__dir__}/lib/rails_bootstrap_form/version"

gem "rake", "~> 13.0"

gem "rspec-rails"

gem "rails", RailsBootstrapForm::REQUIRED_RAILS_VERSION

group :test do
  gem "codeclimate-test-reporter", require: nil
end
