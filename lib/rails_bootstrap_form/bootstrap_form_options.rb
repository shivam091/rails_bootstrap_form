# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  # Container for bootstrap specific form builder options. It controls options
  # that define form layout, grid sizing, and few other configurable options.
  # They are passed-in into form builder helper and field helpers via
  # `:bootstrap_form` option.
  #
  # For example:
  #
  #   bootstrap_form_with model: @user, bootstrap_form: {layout: :inline} do |f|
  #      f.text_field :email, bootstrap_form: {label: {text: "Your email"}}
  #   end
  #
  class BootstrapFormOptions

    # Controls form and field layout. It can be "vertical, "horizontal", or "inline".
    # It can also be "floating" if field should have floating labels.
    attr_accessor :layout

    # A CSS class that will be applied to all form fields and it can be overridden
    # by the `BootstrapFormOptions` object. Default is `form-control`.
    attr_accessor :field_class

    # An additional CSS class that will be added along with the existing
    # `field_class` of the field. Default is nil.
    attr_accessor :additional_field_class

    # Describes help text for the HTML field. Help text is automatically read
    # from translation file. If you want to customize it, you can pass string.
    # You can also set it false if you do not want help text displayed.
    # Default is nil.
    attr_accessor :help_text

    def initialize(options = {})
      set_defaults
      set_bootstrap_form_options(options)
    end

    def horizontal?
      @layout.to_s == "horizontal"
    end

    def inline?
      @layout.to_s == "inline"
    end

    def vertical?
      @layout.to_s == "vertical"
    end

    def floating?
      @layout.to_s == "floating"
    end

    # This will return a copy of `BootstrapFormOptions` object with new options set
    # that don't affect original object. This way we can have options specific
    # to a given form field. For example, we can change grid just for one field:
    #
    #   bootstrap_form_with model: @user do |f|
    #     f.text_field :email, bootstrap_form: {label_col_class: "col-md-6", control_col_class: "col-md-6"}
    #     f.password_field :password
    #   end
    #
    def scoped(options = {})
      scope = clone
      scope.set_bootstrap_form_options(options)
      scope
    end

    def set_bootstrap_form_options(options)
      options.is_a?(Hash) && options.each do |key, value|
        public_send("#{key}=", value)
      end
    end

    def set_defaults
      @layout = "vertical"

      @field_class = "form-control"
      @additional_field_class = nil

      @help_text = nil
    end

    private :set_defaults
  end
end
