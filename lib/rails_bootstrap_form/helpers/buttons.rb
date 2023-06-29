# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module Buttons
      extend ActiveSupport::Concern

      def self.included(base_class)
        def button(value, options, &block)
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))

          value, options = nil, value.merge(options) if value.is_a?(Hash)

          add_css_class!(options, "btn")
          add_css_class!(options, button_variant_class(options))

          button_html = if (bootstrap.render_as_button? || block)
            button_tag(value, options, &block)
          else
            submit(value, options)
          end

          if bootstrap.layout_inline?
            tag.div(class: "col-12") { button_html }
          else
            button_html
          end
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
    end
  end
end
