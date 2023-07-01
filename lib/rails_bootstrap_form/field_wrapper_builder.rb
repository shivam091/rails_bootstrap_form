# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module FieldWrapperBuilder

    private

    def field_wrapper_builder(attribute, bootstrap, options, html_options = nil, &block)
      field_options = field_css_options(attribute, bootstrap, options, html_options.try(:symbolize_keys!))

      field_wrapper(attribute, bootstrap, field_options, &block)
    end

    def field_wrapper(attribute, bootstrap, options, &block)
      label = draw_label(attribute, options, bootstrap)
      help_text = help_text(attribute, bootstrap)
      wrapper_content = ActiveSupport::SafeBuffer.new

      if bootstrap.layout_horizontal?
        wrapper_content << label
        wrapper_content << tag.div(class: bootstrap.field_col_wrapper_class) do
          input_group_wrapper(attribute, bootstrap) do
            capture(&block)
          end + help_text
        end
      else
        if bootstrap.floating?
          wrapper_content << input_group_wrapper(attribute, bootstrap) do
            tag.div(class: floating_label_classes(attribute)) do
              capture(&block) + label
            end
          end
          wrapper_content << help_text
        else
          wrapper_content << label
          wrapper_content << input_group_wrapper(attribute, bootstrap) do
            capture(&block)
          end
          wrapper_content << help_text
        end
      end

      if bootstrap.wrapper
        tag.div(**field_wrapper_options(bootstrap)) do
          wrapper_content
        end
      else
        wrapper_content
      end
    end

    def field_wrapper_options(bootstrap)
      wrapper_options = bootstrap.wrapper

      {}.tap do |option|
        option[:class] = field_wrapper_classes(bootstrap)
        option.merge!(wrapper_options.except(:class)) if wrapper_options.is_a?(Hash)
      end
    end

    def field_wrapper_classes(bootstrap)
      classes = []
      classes << "row" if bootstrap.layout_horizontal?
      classes << field_wrapper_default_class(bootstrap)
      classes << bootstrap.wrapper[:class] if bootstrap.wrapper.is_a?(Hash)
      classes.flatten.compact
    end

    def field_wrapper_default_class(bootstrap)
      bootstrap.layout_inline? ? "col-12" : "mb-3"
    end

    def field_css_options(attribute, bootstrap, options, html_options)
      css_options = (html_options || options)

      field_classes = build_field_classes(attribute, bootstrap, css_options)

      css_options[:class] = field_classes.flatten.compact
      css_options.merge!(required_field_options(attribute, options))
      add_placeholder_if_required!(css_options, attribute, bootstrap)

      css_options
    end

    def floating_label_classes(attribute)
      classes = Array("form-floating")
      # Floating label fields with input group requires `is-invalid` class in
      # order to display error messages.
      classes << "is-invalid" if is_invalid?(attribute)
      classes
    end

    def build_field_classes(attribute, bootstrap, css_options)
      field_classes = Array(bootstrap.field_class) <<
      field_classes << [bootstrap.additional_field_class || css_options[:class]]
      field_classes << "is-invalid" if is_invalid?(attribute)
      field_classes << "#{bootstrap.field_class}-#{bootstrap.size}" if is_size_valid?(bootstrap)
      field_classes
    end

    def placeholder_required?(bootstrap)
      (bootstrap.floating? && !bootstrap.layout_horizontal?) || bootstrap.layout_inline?
    end

    def add_placeholder_if_required!(css_options, attribute, bootstrap)
      css_options[:placeholder] ||= label_text(attribute, bootstrap) if placeholder_required?(bootstrap)
      css_options
    end
  end
end
