# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module RadioButton
      extend ActiveSupport::Concern

      def self.included(base_class)
        def radio_button_label(attribute, value, options, bootstrap)
          unless bootstrap.skip_label?
            label_options = {
              value: value,
              class: radio_button_label_class(attribute, bootstrap, options)
            }
            label_options[:for] = options[:id] if options[:id].present?

            label_text = label_text(attribute, bootstrap)

            label(attribute, label_text, label_options)
          end
        end

        def radio_button_classes(attribute, options)
          classes = Array(options[:class]) << "form-check-input"
          classes << "is-invalid" if is_invalid?(attribute)
          classes.flatten.compact
        end

        def radio_button_label_class(attribute, bootstrap, options)
          classes = Array("form-check-label") << bootstrap.additional_label_class
          classes << "required" if is_field_required?(attribute, options)
          classes << "is-invalid" if is_invalid?(attribute)
          classes << bootstrap.hide_class if bootstrap.hide_label?
          classes.flatten.compact
        end

        def radio_button_wrapper_classes(bootstrap)
          classes = Array("form-check")
          classes << "form-check-inline" if bootstrap.inline?
          classes.flatten.compact
        end

        def radio_button_container_classes(bootstrap)
          classes = Array(bootstrap.field_col_wrapper_class)
          classes << field_offset_class(bootstrap.label_col_wrapper_class)
          classes.flatten.compact
        end

        def bootstrap_radio_button(attribute, value, options, bootstrap)
          options[:class] = radio_button_classes(attribute, options)
          radio_button_field = radio_button_without_bootstrap(attribute, value, options)
          radio_button_label = radio_button_label(attribute, value, options, bootstrap)

          radio_button_field + radio_button_label
        end

        private :radio_button_label, :radio_button_classes, :radio_button_label_class,
                :radio_button_wrapper_classes, :radio_button_container_classes
      end
    end
  end
end
