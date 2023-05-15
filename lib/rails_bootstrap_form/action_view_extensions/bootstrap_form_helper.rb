# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module ActionViewExtensions
    # This module creates `RailsBootstrapForm` wrappers around the default form_with
    # and form_for methods.
    #
    # Example:
    #
    #   bootstrap_form_for @user do |f|
    #     f.text_field :name
    #   end
    #
    # Example:
    #
    #   bootstrap_form_with model: @user do |f|
    #     f.text_field :name
    #   end
    #
    module BootstrapFormHelper
      def bootstrap_form_for(record, options = {}, &block)
        options.reverse_merge!(builder: RailsBootstrapForm::BootstrapFormBuilder)

        supress_form_field_errors do
          form_for(record, options, &block)
        end
      end

      def bootstrap_form_with(options = {}, &block)
        options.reverse_merge!(builder: RailsBootstrapForm::BootstrapFormBuilder)

        supress_form_field_errors do
          form_with(**options, &block)
        end
      end

      def supress_form_field_errors
        original_proc = ActionView::Base.field_error_proc
        ActionView::Base.field_error_proc = RailsBootstrapForm.field_error_proc
        yield
      ensure
        ActionView::Base.field_error_proc = original_proc
      end

      private :supress_form_field_errors
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include RailsBootstrapForm::ActionViewExtensions::BootstrapFormHelper
end
