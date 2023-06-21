# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module RichTextArea
      extend ActiveSupport::Concern

      included do
        def rich_text_area(attribute, options = {})
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          bootstrap.set_field_class!("trix-content form-control")

          field_wrapper_builder(attribute, bootstrap, options) do
            super(attribute, options)
          end
        end
      end
    end
  end
end
