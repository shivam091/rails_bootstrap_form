# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module ColorField
      extend ActiveSupport::Concern

      included do
        def color_field(attribute, options = {})
          options = {
            bootstrap: {
              field_class: "form-control form-control-color",
              floating: false
            }
          }.deep_merge!(options)

          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          field_wrapper_builder(attribute, bootstrap, options) do
            super(attribute, options)
          end
        end
      end
    end
  end
end
