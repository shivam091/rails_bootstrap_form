# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module RangeField
      extend ActiveSupport::Concern

      included do
        def range_field(attribute, options = {})
          options = {bootstrap: {field_class: "form-range"}}.deep_merge!(options)

          field_wrapper_builder(attribute, options) do
            super(attribute, options)
          end
        end
      end
    end
  end
end
