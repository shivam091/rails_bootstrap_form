# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CollectionCheckBoxes
      extend ActiveSupport::Concern

      included do
        def collection_check_boxes(attribute, collection, value_method, text_method, options = {}, html_options = {})
          bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap_options.disabled?

          options[:multiple] = true

          inputs = inputs_collection(attribute, collection, value_method, text_method, bootstrap_options, options) do |attribute, value, options|
            check_box(attribute, options, value, nil)
          end

          if options.delete(:include_hidden) { true }
            inputs.prepend(hidden_field(attribute, value: "", multiple: options[:multiple]))
          end

          field_wrapper_builder(attribute, bootstrap_options, options, html_options) do
            concat(tag.div(class: control_specific_class(:collection_check_boxes)) do
              concat(inputs)
            end)
          end
        end
      end
    end
  end
end
