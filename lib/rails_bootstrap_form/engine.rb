# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

require "rails/railtie"

module RailsBootstrapForm
  class Engine < Rails::Engine
    config.eager_load_namespaces << RailsBootstrapForm
    config.autoload_paths << File.expand_path("lib", __dir__)
  end
end
