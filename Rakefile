# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative "demo/config/application"

Rails.application.load_tasks

RSpec::Core::RakeTask.new(:spec)

task default: :spec
