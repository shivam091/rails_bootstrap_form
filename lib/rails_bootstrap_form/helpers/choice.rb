# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module Choice
      extend ActiveSupport::Concern

      private

      [:check_box, :radio_button].each do |tag_name|
        define_method("#{tag_name}_label") do |attribute, value, options, bootstrap|
          unless bootstrap.skip_label?
            label_options = {
              class: choice_label_classes(attribute, bootstrap, options)
            }
            label_options[:value] = value if tag_name.eql?(:radio_button)
            label_options[:for] = options[:id] if options[:id].present?

            label_text = label_text(attribute, bootstrap)

            label(attribute, label_text, label_options)
          end
        end
      end

      [:check_box, :radio_button].each do |tag_name|
        define_method("bootstrap_#{tag_name}") do |attribute, value, options, bootstrap|
          options[:class] = choice_classes(attribute, bootstrap, options)

          if tag_name.eql?(:check_box)
            choice_field = check_box_without_bootstrap(attribute, options, value, nil)
            choice_label = check_box_label(attribute, value, options, bootstrap)
          else
            choice_field = radio_button_without_bootstrap(attribute, value, options)
            choice_label = radio_button_label(attribute, value, options, bootstrap)
          end

          choice_field + choice_label
        end
      end

      [:check_box, :radio_button].each do |tag_name|
        define_method("build_#{tag_name}_html") do |attribute, value, bootstrap, options|
          tag.div(class: choice_wrapper_classes(bootstrap)) do
            concat(send("bootstrap_#{tag_name}", attribute, value, options, bootstrap))
            concat(help_text(attribute, bootstrap))
            concat(generate_error(attribute)) if is_invalid?(attribute)
          end
        end
      end

      [:check_box, :radio_button].each do |tag_name|
        define_method("build_wrapped_#{tag_name}_html") do |bootstrap, tag_html|
          tag.div(**field_wrapper_options(bootstrap)) do
            if bootstrap.layout_horizontal?
              tag.div(class: choice_container_classes(bootstrap)) { tag_html }
            else
              tag_html
            end
          end
        end
      end

      def choice_classes(attribute, bootstrap, options)
        classes = Array("form-check-input") << [bootstrap.additional_field_class || options[:class]]
        classes << "is-invalid" if is_invalid?(attribute)
        classes.flatten.compact
      end

      def choice_label_classes(attribute, bootstrap, options)
        classes = Array("form-check-label") << bootstrap.additional_label_class
        classes << "required" if is_field_required?(attribute, options)
        classes << "is-invalid" if is_invalid?(attribute)
        classes << bootstrap.hide_class if bootstrap.hide_label?
        classes.flatten.compact
      end

      def choice_container_classes(bootstrap)
        classes = Array(bootstrap.field_col_wrapper_class)
        classes << field_offset_class(bootstrap.label_col_wrapper_class)
        classes.flatten.compact
      end

      def choice_wrapper_classes(bootstrap)
        classes = Array("form-check")
        classes << "form-check-inline" if bootstrap.inline?
        classes << "form-switch" if bootstrap.switch?
        classes.flatten.compact
      end

      def collection_input_checked?(checked, obj, input_value)
        checked == input_value || Array(checked).try(:include?, input_value) ||
          checked == obj || Array(checked).try(:include?, obj)
      end
    end
  end
end
