# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

require "action_view"
require "action_pack"
require "rails_bootstrap_form/action_view_extensions/bootstrap_form_helper"
require "#{Gem::Specification.find_by_name('actiontext').gem_dir}/app/helpers/action_text/tag_helper"

module RailsBootstrapForm
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Configuration
    autoload :BootstrapFormOptions
    autoload :BootstrapFormBuilder
    autoload :FieldWrapperBuilder
    autoload :InputGroupBuilder
    autoload :Inputs
    autoload :Helpers
  end

  class << self
    def eager_load!
      super
      RailsBootstrapForm::Helpers.eager_load!
      RailsBootstrapForm::Inputs.eager_load!
    end

    def config
      @config ||= RailsBootstrapForm::Configuration.new
    end

    def configure
      yield config
    end
  end

  # Override `field_error_proc` to suppress errors coming from user defined
  # `field_error_proc`.
  mattr_accessor :field_error_proc
  @@field_error_proc = proc do |html_tag, _instance_tag|
    html_tag
  end

end

require "rails_bootstrap_form/engine" if defined?(Rails)
