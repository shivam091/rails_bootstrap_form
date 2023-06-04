# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CollectionRadioButtons
      extend ActiveSupport::Concern

      included do
        def collection_radio_buttons(attribute, collection, value_method, text_method, options = {}, html_options = {})
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          inputs = inputs_collection(attribute, collection, value_method, text_method, bootstrap, options) do |attribute, value, options|
            bootstrap_opts = bootstrap_form_options.scoped(options.delete(:bootstrap))

            tag.div(class: choice_wrapper_classes(bootstrap_opts)) do
              bootstrap_radio_button(attribute, value, options, bootstrap_opts)
            end
          end

          field_wrapper_builder(attribute, bootstrap, options, html_options) do
            concat(tag.div(class: control_specific_class(:collection_radio_buttons)) do
              concat(inputs)
            end)
          end
        end
      end
    end
  end
end
