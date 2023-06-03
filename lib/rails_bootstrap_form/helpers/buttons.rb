# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Helpers
    module Buttons
      extend ActiveSupport::Concern

      def self.included(base_class)
        def render_button(value = nil, options = {}, &block)
          value, options = nil, value if value.is_a?(Hash)
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))

          button_html = if (bootstrap.render_as_button? || block)
            button(value, options, &block)
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
          add_css_class!(options, "btn btn-secondary")
          render_button(value, options, &block)
        end

        def primary(value = nil, options = {}, &block)
          add_css_class!(options, "btn btn-primary")
          render_button(value, options, &block)
        end

        def danger(value = nil, options = {}, &block)
          add_css_class!(options, "btn btn-danger")
          render_button(value, options, &block)
        end
      end
    end
  end
end
