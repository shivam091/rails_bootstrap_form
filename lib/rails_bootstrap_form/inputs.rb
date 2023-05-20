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

    def check_box(attribute, options = {}, checked_value = "1", unchecked_value = "0", &block)
      bootstrap_options = bootstrap_form_options.scoped(options.delete(:bootstrap_form))

      options[:class] = check_box_classes(attribute, options)

      check_box_field = super(attribute, options, checked_value, unchecked_value)
      check_box_help_text = help_text(attribute, bootstrap_options)

      check_box_label = check_box_label(attribute, checked_value, options, bootstrap_options, &block)

      check_box_html = tag.div(class: check_box_wrapper_class(bootstrap_options)) do
        concat(check_box_field)
        concat(check_box_label)
        concat(check_box_help_text)
        concat(generate_error(attribute)) if is_invalid?(attribute)
      end

      check_box_html
    end

    def collection_check_boxes(attribute, collection, value_method, text_method, options = {}, html_options = {}, &block)
      options[:multiple] = true

      inputs = ActiveSupport::SafeBuffer.new

      collection.each_with_index do |object, index|
        input_value = value_method.respond_to?(:call) ? value_method.call(object) : object.send(value_method)
        input_options = {
          bootstrap_form: {
            label_text: text_method.respond_to?(:call) ? text_method.call(object) : object.send(text_method)
          }
        }.deep_merge!(options)

        inputs << check_box(attribute, input_options, input_value, nil)
      end

      inputs
    end
  end
end
