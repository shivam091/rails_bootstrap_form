# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module CheckBox
      extend ActiveSupport::Concern

      def self.included(base_class)
        def check_box_label(attribute, checked_value, options, bootstrap, &block)
          unless bootstrap.skip_label?
            label_options = {
              class: check_box_label_class(attribute, bootstrap, options)
            }
            label_options[:for] = options[:id] if options[:id].present?

            label_text = check_box_label_text(attribute, options, bootstrap, &block)

            label(attribute, label_text, label_options)
          end
        end

        def check_box_label_text(attribute, options, bootstrap, &block)
          block ? capture(&block) : label_text(attribute, bootstrap)
        end

        def check_box_classes(attribute, options)
          classes = Array(options[:class]) << "form-check-input"
          classes << "is-invalid" if is_invalid?(attribute)
          classes.flatten.compact
        end

        def check_box_label_class(attribute, bootstrap, options)
          classes = Array("form-check-label") << bootstrap.additional_label_class
          classes << "required" if is_field_required?(attribute, options)
          classes << "is-invalid" if is_invalid?(attribute)
          classes << bootstrap.hide_class if bootstrap.hide_label?
          classes.flatten.compact
        end

        def check_box_wrapper_classes(bootstrap)
          classes = Array("form-check")
          classes << "form-switch" if bootstrap.switch?
          classes << "form-check-inline" if bootstrap.inline?
          classes.flatten.compact
        end

        def check_box_container_classes(bootstrap)
          classes = Array(bootstrap.field_col_wrapper_class)
          classes << field_offset_class(bootstrap.label_col_wrapper_class)
          classes.flatten.compact
        end

        def bootstrap_check_box(attribute, value, options, bootstrap)
          options[:class] = check_box_classes(attribute, options)
          check_box_field = check_box_without_bootstrap(attribute, options, value, nil)
          check_box_label = check_box_label(attribute, value, options, bootstrap)

          check_box_field + check_box_label
        end

        private :check_box_label, :check_box_classes, :check_box_label_class,
                :check_box_wrapper_classes, :check_box_container_classes,
                :bootstrap_check_box
      end
    end
  end
end
