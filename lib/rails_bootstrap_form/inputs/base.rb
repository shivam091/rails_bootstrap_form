# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module Base
      extend ActiveSupport::Concern

      included do
        def inputs_collection(attribute, collection, value_method, text_method, bootstrap, options = {})
          inputs = ActiveSupport::SafeBuffer.new

          collection.each do |object|
            input_options = {
              bootstrap: {
                label_text: text_method.respond_to?(:call) ? text_method.call(object) : object.send(text_method),
                help_text: false,
                inline: bootstrap.inline?
              }
            }.deep_merge!(options)

            if (checked = input_options[:checked])
              input_options[:checked] = collection_input_checked?(checked, object, object.send(value_method))
            end

            input_value = value_method.respond_to?(:call) ? value_method.call(object) : object.send(value_method)

            inputs << yield(attribute, input_value, input_options)
          end

          inputs
        end
      end

      class_methods do
        def bootstrap_field(field_name)
          define_method(field_name) do |attribute, options = {}|
            bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
            return super(attribute, options) if bootstrap.disabled?

            field_wrapper_builder(attribute, bootstrap, options) do
              super(attribute, options)
            end
          end
        end

        def bootstrap_select_group(field_name)
          define_method(field_name) do |attribute, options = {}, html_options = {}|
            options = {bootstrap: {field_class: "form-select"}}.deep_merge!(options)

            bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
            return super(attribute, options, html_options) if bootstrap.disabled?

            field_wrapper_builder(attribute, bootstrap, options, html_options) do
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
