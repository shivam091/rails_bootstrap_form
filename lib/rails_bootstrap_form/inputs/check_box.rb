# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CheckBox
      extend ActiveSupport::Concern

      included do
        def check_box(attribute, options = {}, checked_value = "1", unchecked_value = "0", &block)
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          options[:class] = check_box_classes(attribute, options)

          check_box_field = super(attribute, options, checked_value, unchecked_value)
          check_box_help_text = help_text(attribute, bootstrap)

          check_box_label = check_box_label(attribute, checked_value, options, bootstrap, &block)

          check_box_html = tag.div(**check_box_wrapper_options(bootstrap)) do
            concat(check_box_field)
            concat(check_box_label)
            concat(check_box_help_text)
            concat(generate_error(attribute)) if (is_invalid?(attribute) && !bootstrap.inline?)
          end

          if (bootstrap.layout_horizontal? && !bootstrap.inline?)
            tag.div(class: field_wrapper_classes(bootstrap)) do
              tag.div(class: check_box_container_classes(bootstrap)) do
                check_box_html
              end
            end
          elsif bootstrap.layout_inline?
            tag.div(class: "col-12") { check_box_html }
          else
            check_box_html
          end
        end
      end
    end
  end
end
