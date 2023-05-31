# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module GroupedCollectionSelect
      extend ActiveSupport::Concern

      included do
        def grouped_collection_select(attribute, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
          options = {bootstrap: {field_class: "form-select"}}.deep_merge!(options)

          bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap))
          return super if bootstrap_options.disabled?

          field_wrapper_builder(attribute, bootstrap_options, options, html_options) do
            super(attribute, collection, group_method, group_label_method, option_key_method, option_value_method, options, html_options)
          end
        end
      end
    end
  end
end
