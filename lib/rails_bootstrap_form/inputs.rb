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

    FIELD_HELPERS.each do |field_tag_name|
      define_method(field_tag_name) do |attribute, options = {}|
        field_wrapper_builder(attribute, options) do
          super(attribute, options)
        end
      end
    end

    def select(attribute, choices = nil, options = {}, html_options = {}, &block)
      options = options.reverse_merge(bootstrap_form: {field_class: "form-select"})

      field_wrapper_builder(attribute, options, html_options) do
        super(attribute, choices, options, html_options, &block)
      end
    end

    def range_field(attribute, options = {})
      options = options.reverse_merge(bootstrap_form: {field_class: "form-range"})

      field_wrapper_builder(attribute, options) do
        super(attribute, options)
      end
    end

    def color_field(attribute, options = {})
      options = options.reverse_merge(bootstrap_form: {field_class: "form-control form-control-color"})

      field_wrapper_builder(attribute, options) do
        super(attribute, options)
      end
    end
  end
end
