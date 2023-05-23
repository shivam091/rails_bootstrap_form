# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CollectionCheckBoxes
      extend ActiveSupport::Concern

      included do
        def collection_check_boxes(attribute, collection, value_method, text_method, options = {}, html_options = {}, &block)
          options[:multiple] = true

          inputs = ActiveSupport::SafeBuffer.new

          collection.each do |object|
            input_value = value_method.respond_to?(:call) ? value_method.call(object) : object.send(value_method)
            input_options = {
              bootstrap_form: {
                label_text: text_method.respond_to?(:call) ? text_method.call(object) : object.send(text_method),
                inline: true
              }
            }.deep_merge!(options)

            inputs << check_box(attribute, input_options, input_value, nil)
          end

          if options.delete(:include_hidden) { true }
            inputs.prepend(hidden_field(attribute, value: "", multiple: options[:multiple]))
          end

          field_wrapper_builder(attribute, options, html_options) do
            concat(tag.div(class: control_specific_class(:collection_check_boxes)) do
              concat(inputs)
            end)
          end
        end
      end
    end
  end
end
