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

          inputs = ActiveSupport::SafeBuffer.new

          collection.each do |object|
            input_value = value_method.respond_to?(:call) ? value_method.call(object) : object.send(value_method)
            input_options = {
              bootstrap: {
                label_text: text_method.respond_to?(:call) ? text_method.call(object) : object.send(text_method),
                inline: true
              }
            }.deep_merge!(options)

            if (checked = input_options[:checked])
              input_options[:checked] = collection_input_checked?(checked, object, object.send(value_method))
            end

            inputs << radio_button(attribute, input_value, input_options)
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
