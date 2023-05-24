# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CheckBox
      extend ActiveSupport::Concern

      included do
        def check_box(attribute, options = {}, checked_value = "1", unchecked_value = "0", &block)
          bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap_form))

          options[:class] = check_box_classes(attribute, options)

          check_box_field = super(attribute, options, checked_value, unchecked_value)
          check_box_help_text = help_text(attribute, bootstrap_options)

          check_box_label = check_box_label(attribute, checked_value, options, bootstrap_options, &block)

          check_box_html = tag.div(**check_box_wrapper_options(bootstrap_options)) do
            concat(check_box_field)
            concat(check_box_label)
            concat(check_box_help_text) unless bootstrap_options.inline?
            concat(generate_error(attribute)) if (is_invalid?(attribute) && !bootstrap_options.inline?)
          end

          if bootstrap_options.inline?
            check_box_html
          else
            if bootstrap_options.layout_horizontal?
              tag.div(class: field_wrapper_classes(bootstrap_options)) do
                tag.div(class: check_box_container_classes(bootstrap_options)) do
                  check_box_html
                end
              end
            else
              check_box_html
            end
          end
        end
      end
    end
  end
end
