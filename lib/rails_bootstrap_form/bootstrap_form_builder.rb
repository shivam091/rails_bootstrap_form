# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

    include RailsBootstrapForm::FieldWrapperBuilder

    delegate :capture, :concat, :tag, to: :@template

    attr_accessor :bootstrap_form_options

    def initialize(object_name, object, template, options)
      @bootstrap_form_options = RailsBootstrapForm::BootstrapFormOptions.new(options.delete(:bootstrap_form))
      apply_default_form_options(options)
      super(object_name, object, template, options)
    end

    def apply_default_form_options(options)
      options[:html] ||= {}
      options[:html].reverse_merge!(RailsBootstrapForm.config.default_form_attributes)
    end

    private :apply_default_form_options
  end
end
