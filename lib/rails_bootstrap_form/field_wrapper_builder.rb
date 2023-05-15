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
      label = label(attribute, bootstrap_options)
      help_text = help_text(attribute, bootstrap_options)

      tag.div(class: field_wrapper_classes) do
        concat(label)
        concat(capture(&block))
        concat(help_text)
      end
    end

    def field_wrapper_classes
      classes = [form_wrapper_default_class]
      classes.flatten.compact
    end

    def field_wrapper_options
    end

    def form_wrapper_default_class
      "mb-3"
    end

    def field_css_options(attribute, bootstrap_options, options, html_options)
      css_options = (html_options || options)

      field_classes = [
        bootstrap_options.field_class,
        bootstrap_options.additional_field_class
      ]
      css_options[:class] = field_classes.flatten.compact

      css_options
    end

    private :field_wrapper, :field_wrapper_classes, :form_wrapper_default_class,
            :field_css_options
  end
end
