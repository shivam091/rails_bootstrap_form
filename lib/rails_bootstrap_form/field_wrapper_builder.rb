# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module FieldWrapperBuilder
    def field_wrapper_builder(attribute, options, html_options = nil, &block)
      bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap_form))

      field_options = field_css_options(attribute, bootstrap_options, options, html_options.try(:symbolize_keys!))

      field_wrapper(attribute, bootstrap_options, field_options, &block)
    end

    def field_wrapper(attribute, bootstrap_options, options, &block)
      label = draw_label(attribute, options, bootstrap_options)
      help_text = help_text(attribute, bootstrap_options)

      if bootstrap_options.layout_horizontal?
        tag.div(**field_wrapper_options(bootstrap_options)) do
          concat(label)
          concat(tag.div(class: bootstrap_options.field_col_wrapper_class) do
            concat(input_group_wrapper(attribute, bootstrap_options) do
              capture(&block)
            end)
            concat(help_text)
          end)
        end
      else
        if bootstrap_options.floating
          tag.div(**field_wrapper_options(bootstrap_options)) do
            concat(input_group_wrapper(attribute, bootstrap_options) do
              tag.div(class: floating_label_classes(attribute)) do
                concat(capture(&block))
                concat(label)
              end
            end)
            concat(help_text)
          end
        else
          tag.div(**field_wrapper_options(bootstrap_options)) do
            concat(label)
            concat(input_group_wrapper(attribute, bootstrap_options) do
              capture(&block)
            end)
            concat(help_text)
          end
        end
      end
    end

    def field_wrapper_options(bootstrap_options)
      {}.tap do |option|
        option[:class] = field_wrapper_classes(bootstrap_options)
      end.merge(bootstrap_options.wrapper_options)
    end

    def field_wrapper_classes(bootstrap_options)
      classes = []
      classes << "row" if bootstrap_options.layout_horizontal?
      classes << "mb-3"
      classes.flatten.compact
    end

    def field_css_options(attribute, bootstrap_options, options, html_options)
      css_options = (html_options || options)

      field_classes = Array(options[:class])
      field_classes << [
        bootstrap_options.field_class,
        bootstrap_options.additional_field_class
      ]
      field_classes << "is-invalid" if is_invalid?(attribute)
      if is_size_valid?(bootstrap_options)
        field_classes << "#{bootstrap_options.field_class}-#{bootstrap_options.size}"
      end

      css_options[:class] = field_classes.flatten.compact
      css_options.merge!(required_field_options(attribute, options))

      if (bootstrap_options.floating && !bootstrap_options.layout_horizontal?)
        css_options[:placeholder] ||= label_text(attribute, bootstrap_options)
      end

      css_options
    end

    def floating_label_classes(attribute)
      classes = Array("form-floating")
      # Floating label fields with input group requires `is-invalid` class in
      # order to display error messages.
      classes << "is-invalid" if is_invalid?(attribute)
      classes
    end

    private :field_wrapper, :field_wrapper_classes, :field_css_options,
            :floating_label_classes
  end
end
