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
            field_wrapper_builder(attribute, options) do
              super(attribute, options)
            end
          end
        end

        def bootstrap_select_group(field_name)
          define_method(field_name) do |attribute, options = {}, html_options = {}|
            options = {bootstrap_form: {field_class: "form-select"}}.deep_merge!(options)

            field_wrapper_builder(attribute, options, html_options) do
              tag.div(class: control_specific_class(field_name)) do
                super(attribute, options, html_options)
              end
            end
          end
        end
      end
    end
  end
end
