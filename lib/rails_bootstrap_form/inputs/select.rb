# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module Select
      extend ActiveSupport::Concern

      included do
        def select(attribute, choices = nil, options = {}, html_options = {}, &block)
          options = {bootstrap: {field_class: "form-select"}}.deep_merge!(options)

          bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap_options.disabled?

          field_wrapper_builder(attribute, bootstrap_options, options, html_options) do
            super(attribute, choices, options, html_options, &block)
          end
        end
      end
    end
  end
end
