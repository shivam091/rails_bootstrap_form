# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CheckBox
      extend ActiveSupport::Concern

      included do
        def check_box(attribute, options = {}, checked_value = "1", unchecked_value = "0")
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          check_box_html = build_check_box_html(attribute, checked_value, bootstrap, options)

          if bootstrap.wrapper
            build_wrapped_check_box_html(bootstrap, check_box_html)
          else
            check_box_html
          end
        end
      end
    end
  end
end
