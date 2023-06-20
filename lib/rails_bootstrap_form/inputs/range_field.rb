# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module RangeField
      extend ActiveSupport::Concern

      included do
        def range_field(attribute, options = {})
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          bootstrap.set_field_class!("form-range")
          bootstrap.disable_floating_labels!

          field_wrapper_builder(attribute, bootstrap, options) do
            super(attribute, options)
          end
        end
      end
    end
  end
end
