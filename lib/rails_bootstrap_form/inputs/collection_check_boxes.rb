# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CollectionCheckBoxes
      extend ActiveSupport::Concern

      included do
        def collection_check_boxes(attribute, collection, value_method, text_method, options = {}, html_options = {})
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          bootstrap.floating = false
          return super if bootstrap.disabled?

          inputs = inputs_collection(attribute, collection, value_method, text_method, bootstrap, options) do |attribute, value, options|
            bootstrap_opts = bootstrap_form_options.scoped(options.delete(:bootstrap))

            tag.div(class: choice_wrapper_classes(bootstrap_opts)) do
              bootstrap_check_box(attribute, value, options, bootstrap_opts)
            end
          end

          if options.delete(:include_hidden) { true }
            inputs.prepend(hidden_field(attribute, value: "", multiple: options[:multiple]))
          end

          field_wrapper_builder(attribute, bootstrap, options, html_options) do
            concat(tag.div(class: control_specific_class(:collection_check_boxes)) do
              concat(inputs)
            end)
          end
        end
      end
    end
  end
end
