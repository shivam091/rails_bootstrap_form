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
            input_options = build_input_options(object, attribute, value_method, text_method, bootstrap, options)
            input_value = resolve_input_value(object, value_method)

            inputs << yield(attribute, input_value, input_options)
          end

          inputs
        end
      end

      class_methods do
        def bootstrap_field(tag_name)
          define_method(tag_name) do |attribute, options = {}|
            bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
            return super(attribute, options) if bootstrap.disabled?

            bootstrap.set_field_class!("form-control")

            field_wrapper_builder(attribute, bootstrap, options) do
              super(attribute, options)
            end
          end
        end

        def bootstrap_select_group(tag_name)
          define_method(tag_name) do |attribute, options = {}, html_options = {}|
            bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
            return super(attribute, options, html_options) if bootstrap.disabled?

            bootstrap.set_field_class!("form-select")
            bootstrap.disable_floating_labels!

            field_wrapper_builder(attribute, bootstrap, options, html_options) do
              tag.fieldset(class: control_specific_class(tag_name)) do
                super(attribute, options, html_options)
              end
            end
          end
        end
      end

      private

      def build_input_options(object, attribute, value_method, text_method, bootstrap, options)
        input_options = {
          bootstrap: {
            label_text: resolve_label_text(text_method, object),
            inline: (bootstrap.inline? || bootstrap.layout_inline?)
          },
          required: false,
          id: sanitized_tag_name(attribute, object.send(value_method))
        }.deep_merge!(options)

        input_options[:checked] = resolve_checked_option(input_options[:checked], object, value_method)

        input_options
      end

      def resolve_label_text(text_method, object)
        text_method.respond_to?(:call) ? text_method.call(object) : object.send(text_method)
      end

      def resolve_input_value(object, value_method)
        value_method.respond_to?(:call) ? value_method.call(object) : object.send(value_method)
      end

      def resolve_checked_option(checked_option, object, value_method)
        return collection_input_checked?(checked_option, object, object.send(value_method)) if checked_option
        false
      end
    end
  end
end
