# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module Buttons
      extend ActiveSupport::Concern

      included do
        def button(value, options, &block)
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          value, options = extract_button_value_and_options(value, options)

          add_button_css_classes!(options, bootstrap)

          button_html = render_button_html(value, options, bootstrap, &block)
          button_html = wrap_button_html(button_html, bootstrap)

          button_html
        end

        def secondary(value = nil, options = {}, &block)
          button(value, options.merge!(variant: "secondary"), &block)
        end

        def primary(value = nil, options = {}, &block)
          button(value, options.merge!(variant: "primary"), &block)
        end

        def danger(value = nil, options = {}, &block)
          button(value, options.merge!(variant: "danger"), &block)
        end
      end

      private

      def button_variant_class(options)
        case options.delete(:variant)
        when "secondary" then "btn-secondary"
        when "primary" then "btn-primary"
        when "danger" then "btn-danger"
        else ""
        end
      end

      def extract_button_value_and_options(value, options)
        return [nil, value.merge(options)] if value.is_a?(Hash)

        [value, options]
      end

      def add_button_css_classes!(options, bootstrap)
        add_css_class!(options, "btn")
        add_css_class!(options, button_variant_class(options))
      end

      def render_button_html(value, options, bootstrap, &block)
        if bootstrap.render_as_button? || block
          button_tag(value, options, &block)
        else
          submit(value, options)
        end
      end

      def wrap_button_html(button_html, bootstrap)
        if bootstrap.layout_inline?
          tag.div(class: "col-12") { button_html }
        else
          button_html
        end
      end
    end
  end
end
