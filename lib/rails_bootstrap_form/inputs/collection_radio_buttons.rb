# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CollectionRadioButtons
      extend ActiveSupport::Concern

      included do
        def collection_radio_buttons(attribute, collection, value_method, text_method, options = {}, html_options = {})
          bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap_options.disabled?

          inputs = inputs_collection(attribute, collection, value_method, text_method, bootstrap_options, options) do |attribute, value, options|
            radio_button(attribute, value, options)
          end

          field_wrapper_builder(attribute, bootstrap_options, options, html_options) do
            concat(tag.div(class: control_specific_class(:collection_radio_buttons)) do
              concat(inputs)
            end)
          end
        end
      end
    end
  end
end
