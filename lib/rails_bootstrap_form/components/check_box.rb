# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Components
    module CheckBox
      extend ActiveSupport::Concern

      def self.included(base_class)
        def check_box_label(attribute, options, bootstrap_options, &block)
          unless bootstrap_options.skip_label
            label_options = {class: check_box_label_class(attribute, bootstrap_options, options)}
            label_options[:for] = options[:id] if options[:id].present?

            label_text = label_text(attribute, bootstrap_options)
            label(attribute, label_text, label_options)
          end
        end

        def check_box_classes(attribute, options)
          classes = Array(options[:class]) << "form-check-input"
          classes << "is-invalid" if is_invalid?(attribute)
          classes.flatten.compact
        end

        def check_box_label_class(attribute, bootstrap_options, options)
          classes = Array("form-check-label") << bootstrap_options.additional_label_class
          classes << "required" if is_field_required?(attribute, options)
          classes << "is-invalid" if is_invalid?(attribute)
          classes << bootstrap_options.hide_class if bootstrap_options.hide_label
          classes.flatten.compact
        end

        def check_box_wrapper_class(bootstrap_options)
          classes = ["mb-3", "form-check"]
          classes << "form-switch" if bootstrap_options.switch
          classes.flatten.compact
        end

        private :check_box_label, :check_box_classes, :check_box_label_class, :check_box_wrapper_class
      end
    end
  end
end
