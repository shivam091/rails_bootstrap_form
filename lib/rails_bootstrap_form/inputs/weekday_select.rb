# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module WeekdaySelect
      extend ActiveSupport::Concern

      included do
        def weekday_select(attribute, options = {}, html_options = {}, &block)
          options = {bootstrap: {field_class: "form-select"}}.deep_merge!(options)

          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          field_wrapper_builder(attribute, bootstrap, options, html_options) do
            super(attribute, options, html_options, &block)
          end
        end
      end
    end
  end
end
