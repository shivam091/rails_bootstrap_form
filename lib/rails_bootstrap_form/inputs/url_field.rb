# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module UrlField
      extend ActiveSupport::Concern

      included do
        bootstrap_field :url_field
      end
    end
  end
end
