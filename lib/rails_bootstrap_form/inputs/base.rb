# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module Base
      extend ActiveSupport::Concern

      class_methods do
        def bootstrap_field(field_name)
          define_method(field_name) do |attribute, options = {}|
            bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap))
            return super(attribute, options) if bootstrap_options.disabled?

            field_wrapper_builder(attribute, bootstrap_options, options) do
              super(attribute, options)
            end
          end
        end

        def bootstrap_select_group(field_name)
          define_method(field_name) do |attribute, options = {}, html_options = {}|
            options = {bootstrap: {field_class: "form-select"}}.deep_merge!(options)

            bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap))
            return super(attribute, options, html_options) if bootstrap_options.disabled?

            field_wrapper_builder(attribute, bootstrap_options, options, html_options) do
              tag.fieldset(class: control_specific_class(field_name)) do
                super(attribute, options, html_options)
              end
            end
          end
        end
      end
    end
  end
end
