# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module RadioButton
      extend ActiveSupport::Concern

      included do
        def radio_button(attribute, value, options = {})
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          radio_button_html = build_radio_button_html(attribute, value, bootstrap, options)

          if bootstrap.wrapper
            build_wrapped_radio_button_html(bootstrap, radio_button_html)
          else
            radio_button_html
          end
        end
      end

      private

      def build_radio_button_html(attribute, value, bootstrap, options)
        tag.div(class: choice_wrapper_classes(bootstrap)) do
          concat(bootstrap_radio_button(attribute, value, options, bootstrap))
          concat(help_text(attribute, bootstrap))
          concat(generate_error(attribute)) if is_invalid?(attribute)
        end
      end

      def build_wrapped_radio_button_html(bootstrap, radio_button_html)
        tag.div(**field_wrapper_options(bootstrap)) do
          if bootstrap.layout_horizontal?
            tag.div(class: choice_container_classes(bootstrap)) { radio_button_html }
          else
            radio_button_html
          end
        end
      end
    end
  end
end
