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

          check_box_html = tag.div(class: choice_wrapper_classes(bootstrap)) do
            concat(bootstrap_check_box(attribute, checked_value, options, bootstrap))
            concat(help_text(attribute, bootstrap))
            concat(generate_error(attribute)) if is_invalid?(attribute)
          end

          if bootstrap.wrapper
            tag.div(**field_wrapper_options(bootstrap)) do
              if bootstrap.layout_horizontal?
                tag.div(class: choice_container_classes(bootstrap)) { check_box_html }
              else
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
