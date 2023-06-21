# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module CollectionSelect
      extend ActiveSupport::Concern

      included do
        def collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {})
          bootstrap = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap.disabled?

          bootstrap.set_field_class!("form-select")

          field_wrapper_builder(attribute, bootstrap, options, html_options) do
            super(attribute, collection, value_method, text_method, options, html_options)
          end
        end
      end
    end
  end
end
