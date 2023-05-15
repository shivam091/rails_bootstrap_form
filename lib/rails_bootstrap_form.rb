# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

require "action_view"
require "action_pack"

module RailsBootstrapForm
  extend ActiveSupport::Autoload

  eager_autoload do

  end

  class << self
    def eager_load!
      super
    end
  end
end

require "rails_bootstrap_form/engine" if defined?(Rails)
