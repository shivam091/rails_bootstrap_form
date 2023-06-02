# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module RadioButton
      extend ActiveSupport::Concern

      def self.included(base_class)
        def radio_button_label(attribute, value, options, bootstrap_options)
          unless bootstrap_options.skip_label?
            label_options = {
              value: value,
              class: radio_button_label_class(attribute, bootstrap_options, options)
            }
            label_options[:for] = options[:id] if options[:id].present?

            label_name = if options[:multiple]
              radio_button_value(attribute, checked_value)
            else
              attribute
            end

            label_text = label_text(attribute, bootstrap_options)

            label(label_name, label_text, label_options)
          end
        end

        def radio_button_wrapper_options(bootstrap_options)
          wrapper_options = bootstrap_options.wrapper

          {}.tap do |option|
            option[:class] = radio_button_wrapper_class(bootstrap_options)
            option.merge!(wrapper_options.except(:class)) if wrapper_options.is_a?(Hash)
          end
        end

        def radio_button_value(attribute, value)
          # label's `for` attribute needs to match checkbox tag's id,
          # IE sanitized value, IE
          # https://github.com/rails/rails/blob/5-0-stable/actionview/lib/action_view/helpers/tags/base.rb#L123-L125
          "#{attribute}_#{value.to_s.gsub(/\s/, "_").gsub(/[^-[[:word:]]]/, "").mb_chars.downcase}"
        end

        def radio_button_classes(attribute, options)
          classes = Array(options[:class]) << "form-check-input"
          classes << "is-invalid" if is_invalid?(attribute)
          classes.flatten.compact
        end

        def radio_button_label_class(attribute, bootstrap_options, options)
          classes = Array("form-check-label") << bootstrap_options.additional_label_class
          classes << "required" if is_field_required?(attribute, options) && !bootstrap_options.inline?
          classes << "is-invalid" if is_invalid?(attribute)
          classes << bootstrap_options.hide_class if bootstrap_options.hide_label?
          classes.flatten.compact
        end

        def radio_button_wrapper_class(bootstrap_options)
          classes = Array("form-check")
          classes << "form-check-inline" if bootstrap_options.inline?
          if (bootstrap_options.layout_vertical? && !bootstrap_options.inline?)
            classes << "mb-3"
          end
          classes << bootstrap_options.wrapper[:class]
          classes.flatten.compact
        end

        def radio_button_container_classes(bootstrap_options)
          classes = Array(bootstrap_options.field_col_wrapper_class)
          classes << field_offset_class(bootstrap_options.label_col_wrapper_class)
          classes.flatten.compact
        end

        private :radio_button_label, :radio_button_classes, :radio_button_label_class,
                :radio_button_wrapper_class, :radio_button_container_classes
      end
    end
  end
end
