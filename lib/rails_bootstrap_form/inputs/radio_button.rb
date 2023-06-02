# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module RadioButton
      extend ActiveSupport::Concern

      included do
        def radio_button(attribute, value, options = {})
          bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap_options.disabled?

          options[:class] = radio_button_classes(attribute, options)

          radio_button_field = super(attribute, value, options)
          radio_button_help_text = help_text(attribute, bootstrap_options)

          radio_button_label = radio_button_label(attribute, value, options, bootstrap_options)

          radio_button_html = tag.div(**radio_button_wrapper_options(bootstrap_options)) do
            concat(radio_button_field)
            concat(radio_button_label)
            concat(radio_button_help_text)
            concat(generate_error(attribute)) if (is_invalid?(attribute) && !bootstrap_options.inline?)
          end

          if (bootstrap_options.layout_horizontal? && !bootstrap_options.inline?)
            tag.div(class: field_wrapper_classes(bootstrap_options)) do
              tag.div(class: radio_button_container_classes(bootstrap_options)) do
                radio_button_html
              end
            end
          elsif bootstrap_options.layout_inline?
            tag.div(class: "col-12") { radio_button_html }
          else
            radio_button_html
          end
        end
      end
    end
  end
end
