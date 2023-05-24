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
          bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap_form))

          if (bootstrap_options.render_as_button? || block)
            button(value, options, &block)
          else
            submit(value, options)
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
