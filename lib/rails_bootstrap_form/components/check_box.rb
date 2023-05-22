# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Components
    module CheckBox
      extend ActiveSupport::Concern

      def self.included(base_class)
        def check_box_label(attribute, checked_value, options, bootstrap_options, &block)
          unless bootstrap_options.skip_label
            label_options = {
              class: check_box_label_class(attribute, bootstrap_options, options)
            }
            label_options[:for] = options[:id] if options[:id].present?

            label_name = if options[:multiple]
              check_box_value(attribute, checked_value)
            else
              attribute
            end

            label_text = check_box_label_text(attribute, options, bootstrap_options, &block)

            label(label_name, label_text, label_options)
          end
        end

        def check_box_wrapper_options(bootstrap_options)
          {}.tap do |option|
            option[:class] = check_box_wrapper_class(bootstrap_options)
          end.merge(bootstrap_options.wrapper_options)
        end

        def check_box_label_text(attribute, options, bootstrap_options, &block)
          block ? capture(&block) : label_text(attribute, bootstrap_options)
        end

        def check_box_value(attribute, value)
          # label's `for` attribute needs to match checkbox tag's id,
          # IE sanitized value, IE
          # https://github.com/rails/rails/blob/5-0-stable/actionview/lib/action_view/helpers/tags/base.rb#L123-L125
          "#{attribute}_#{value.to_s.gsub(/\s/, "_").gsub(/[^-[[:word:]]]/, "").mb_chars.downcase}"
        end

        def check_box_classes(attribute, options)
          classes = Array(options[:class]) << "form-check-input"
          classes << "is-invalid" if is_invalid?(attribute)
          classes.flatten.compact
        end

        def check_box_label_class(attribute, bootstrap_options, options)
          classes = Array("form-check-label") << bootstrap_options.additional_label_class
          classes << "required" if is_field_required?(attribute, options) && !bootstrap_options.inline?
          classes << "is-invalid" if is_invalid?(attribute)
          classes << bootstrap_options.hide_class if bootstrap_options.hide_label
          classes.flatten.compact
        end

        def check_box_wrapper_class(bootstrap_options)
          classes = Array("form-check")
          classes << "form-switch" if bootstrap_options.switch
          classes << "form-check-inline" if bootstrap_options.inline?
          classes << "mb-3" if (!bootstrap_options.inline? && !bootstrap_options.layout_horizontal?)
          classes.flatten.compact
        end

        def check_box_container_classes(bootstrap_options)
          classes = [bootstrap_options.field_col_wrapper_class]
          classes << bootstrap_options.field_offset_class unless bootstrap_options.inline?
          classes.flatten.compact
        end

        private :check_box_label, :check_box_classes, :check_box_label_class,
                :check_box_wrapper_class, :check_box_container_classes
      end
    end
  end
end
