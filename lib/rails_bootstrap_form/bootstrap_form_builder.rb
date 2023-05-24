# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

    include RailsBootstrapForm::FieldWrapperBuilder
    include RailsBootstrapForm::Helpers
    include RailsBootstrapForm::InputGroupBuilder
    include RailsBootstrapForm::Inputs

    delegate :capture, :concat, :tag, to: :@template

    attr_accessor :bootstrap_form_options

    def initialize(object_name, object, template, options)
      @bootstrap_form_options = RailsBootstrapForm::BootstrapFormOptions.new(options[:bootstrap_form])
      apply_default_form_options(options)
      super(object_name, object, template, options)
    end

    def fields_for(record_name, record_object = nil, fields_options = {}, &block)
      fields_options = fields_for_options(record_object, fields_options)
      record_object = nil if record_object.is_a?(Hash) && record_object.extractable_options?
      super(record_name, record_object, fields_options, &block)
    end

    def apply_default_form_options(options)
      options[:html] ||= {}
      options[:html].reverse_merge!(RailsBootstrapForm.config.default_form_attributes)
    end

    def fields_for_options(record_object, fields_options)
      field_options = record_object if record_object.is_a?(Hash) && record_object.extractable_options?
      field_options = {bootstrap_form: options[:bootstrap_form]}.deep_merge!(field_options)
      field_options
    end

    private :apply_default_form_options, :fields_for_options
  end
end
