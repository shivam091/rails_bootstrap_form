# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs

    FIELD_HELPERS = %i[
      text_field
      url_field
      search_field
      telephone_field
      number_field
      email_field
      file_field
      phone_field
      password_field
      text_area
      date_field
      time_field
      datetime_field
      datetime_local_field
      month_field
      week_field
    ].freeze

    DATE_SELECT_HELPERS = %i[
      date_select
      time_select
      datetime_select
    ].freeze

    FIELD_HELPERS.each do |field_tag_name|
      define_method(field_tag_name) do |attribute, options = {}|
        field_wrapper_builder(attribute, options) do
          super(attribute, options)
        end
      end
    end

    DATE_SELECT_HELPERS.each do |field_tag_name|
      define_method(field_tag_name) do |attribute, options = {}, html_options = {}, &block|
        options = {bootstrap_form: {field_class: "form-select"}}.deep_merge!(options)

        field_wrapper_builder(attribute, options, html_options) do
          tag.div(class: control_specific_class(field_tag_name)) do
            super(attribute, options, html_options)
          end
        end
      end
    end

    def select(attribute, choices = nil, options = {}, html_options = {}, &block)
      options = {bootstrap_form: {field_class: "form-select"}}.deep_merge!(options)

      field_wrapper_builder(attribute, options, html_options) do
        super(attribute, choices, options, html_options, &block)
      end
    end

    def collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {})
      options = {bootstrap_form: {field_class: "form-select"}}.deep_merge!(options)

      field_wrapper_builder(attribute, options, html_options) do
        super(attribute, collection, value_method, text_method, options, html_options)
      end
    end

    def grouped_collection_select(attribute, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
      options = {bootstrap_form: {field_class: "form-select"}}.deep_merge!(options)

      field_wrapper_builder(attribute, options, html_options) do
        super(attribute, collection, group_method, group_label_method, option_key_method, option_value_method, options, html_options)
      end
    end

    def time_zone_select(attribute, priority_zones = nil, options = {}, html_options = {})
      options = {bootstrap_form: {field_class: "form-select"}}.deep_merge!(options)

      field_wrapper_builder(attribute, options, html_options) do
        super(attribute, priority_zones, options, html_options)
      end
    end

    def range_field(attribute, options = {})
      options = {bootstrap_form: {field_class: "form-range"}}.deep_merge!(options)

      field_wrapper_builder(attribute, options) do
        super(attribute, options)
      end
    end

    def color_field(attribute, options = {})
      options = {bootstrap_form: {field_class: "form-control form-control-color"}}.deep_merge!(options)

      field_wrapper_builder(attribute, options) do
        super(attribute, options)
      end
    end

    def hidden_field(attribute, options = {})
      options[:value] = object.send(attribute) unless options.key?(:value)

      super(attribute, options)
    end

    def static_field(*args)
      options = args.extract_options!
      attribute = args.first

      static_options = options.merge(
        readonly: true,
        disabled: true,
        bootstrap_form: {
          field_class: bootstrap_form_options.static_field_class
        }
      )

      static_options[:value] = object.send(attribute) unless options.key?(:value)

      text_field(attribute, static_options)
    end
  end
end
