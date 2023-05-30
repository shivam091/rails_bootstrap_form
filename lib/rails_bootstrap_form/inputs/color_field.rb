# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module ColorField
      extend ActiveSupport::Concern

      included do
        def color_field(attribute, options = {})
          options = {bootstrap: {field_class: "form-control form-control-color"}}.deep_merge!(options)

          field_wrapper_builder(attribute, options) do
            super(attribute, options)
          end
        end
      end
    end
  end
end
