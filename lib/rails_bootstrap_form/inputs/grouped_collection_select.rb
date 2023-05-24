# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    module GroupedCollectionSelect
      extend ActiveSupport::Concern

      included do
        def grouped_collection_select(attribute, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
          options = {bootstrap_form: {field_class: "form-select"}}.deep_merge!(options)

          field_wrapper_builder(attribute, options, html_options) do
            super(attribute, collection, group_method, group_label_method, option_key_method, option_value_method, options, html_options)
          end
        end
      end
    end
  end
end