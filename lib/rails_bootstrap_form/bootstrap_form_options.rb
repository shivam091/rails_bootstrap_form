# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  # Container for bootstrap specific form builder options. It controls options
  # that define form layout, grid sizing, and few other configurable options.
  # They are passed-in into form builder helper and field helpers via
  # `:bootstrap` option.
  #
  # For example:
  #
  #   bootstrap_form_with model: @user, bootstrap: {layout: :inline} do |f|
  #      f.text_field :email, bootstrap: {label: {text: "Your email"}}
  #   end
  #
  class BootstrapFormOptions

    # Controls whether to render default Rails form builder element.
    # The default value is `false`.
    attr_accessor :disabled

    # Controls layout of form and field helpers. It can be "vertical,
    # "horizontal", or "inline". The default value is `vertical`.
    attr_accessor :layout

    # A CSS class that will be applied to all form fields.
    # The default value is `nil`.
    attr_accessor :field_class

    # An additional CSS class that will be added along with the existing
    # css classes of field helpers. The default value is nil.
    attr_accessor :additional_field_class

    # Describes help text for the HTML field. Help text is automatically read
    # from translation file. If you want to customize it, you can pass string.
    # You can also set it false if you do not want help text displayed.
    # The default value is nil.
    attr_accessor :help_text

    # An option to customize automatically generated label text.
    # The default value is `nil`.
    attr_accessor :label_text

    # An option to control whether the label is to be displayed or not.
    # The default value is `false`.
    attr_accessor :skip_label

    # An option to control whether the label is only visible to a screen readers.
    # The default value is `false`.
    attr_accessor :hide_label

    # The CSS class that will be used when the label is only accessible to a
    # screen readers. The default value is `visually-hidden`.
    attr_accessor :hide_class

    # A CSS class that will be applied to all label tags when layout is
    # vertical.
    # The default value is `form-label`.
    attr_accessor :label_class

    # An additional CSS class that will be added along with the existing label
    # css classes. The default value is `nil`.
    attr_accessor :additional_label_class

    # Input group specific options. Input groups allow prepending and appending
    # arbitrary html or text to the field.
    #
    # Example:
    #
    #   form.text_field :dollars, bootstrap: {input_group: {prepend: "$", append: ".00"}}
    #   form.text_field :search, bootstrap: {input_group: {append: button_tag("Go", type: :submit, class: "btn btn-secondary")}}
    #
    # Raw or HTML content to be prepended to the field.
    # The default value is `nil`.
    attr_accessor :prepend

    # Raw or HTML content to be appended to the field.
    # The default value is `nil`.
    attr_accessor :append

    # An additional CSS class that will be added to existing input group wrapper
    # css classes. The default value is `nil`.
    attr_accessor :additional_input_group_class

    # An option to control whether the field should have a floating label.
    # The default value is false.
    attr_accessor :floating

    # A CSS class that will be applied to all static fields.
    # The default value is `form-control-plaintext`.
    attr_accessor :static_field_class

    # An option to control whether the check box should look like Bootstrap switches.
    # The default value is `false`.
    attr_accessor :switch

    # An option to control the HTML attributes and options that will be added to
    # the field wrapper. The default value is `{}`.
    attr_accessor :wrapper

    # An option to control the size of input groups, buttons, labels, and fields.
    # The valid values are `sm` and `lg`. The default value is `nil`.
    attr_accessor :size

    # An option to group checkboxes and radio buttons on the same horizontal row.
    # The default value is `false`.
    #
    # Example:
    #   form.collection_radio_buttons :choices, ["yes", "no"], :to_s, :to_s, bootstrap: {inline: true}
    attr_accessor :inline

    # A CSS class that will be applied to all labels when layout is horizontal.
    # The default value is `col-form-label`.
    attr_accessor :label_col_class

    # A CSS class for label column when layout is horizontal.
    # The default value is `col-sm-2`.
    attr_accessor :label_col_wrapper_class

    # A CSS class for field column when layout is horizontal.
    # The default value is `col-sm-10`.
    attr_accessor :field_col_wrapper_class

    # An option to render submit button using `<button type="submit">` instead of
    # `<input type="submit">`.
    # The default value is `false`.
    attr_accessor :render_as_button

    def initialize(options = {})
      set_defaults
      set_bootstrap_form_options(options)
    end

    def layout_horizontal?
      @layout.to_s == "horizontal"
    end

    def layout_inline?
      @layout.to_s == "inline"
    end

    def layout_vertical?
      @layout.to_s == "vertical"
    end

    # This will return a copy of `BootstrapFormOptions` object with new options set
    # that don't affect original object. This way we can have options specific
    # to a given form field. For example, we can change grid just for one field:
    #
    #   bootstrap_form_with model: @user do |f|
    #     f.text_field :email, bootstrap: {label_col_wrapper_class: "col-md-6", field_col_wrapper_class: "col-md-6"}
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

    %i(disabled inline floating switch skip_label hide_label render_as_button).each do |method|
      define_method("#{method}?") { self.send(method) }
    end

    def disable_floating_labels!
      self.floating = false
    end

    def set_field_class!(css_class)
      self.field_class ||= css_class
    end

    private

    def set_defaults
      @disabled = false

      @layout = "vertical"

      @field_class = nil
      @additional_field_class = nil

      @help_text = nil

      @label_text = nil
      @skip_label = false
      @hide_label = false
      @hide_class = "visually-hidden"
      @label_class = "form-label"
      @additional_label_class = nil

      @prepend = nil
      @append = nil
      @additional_input_group_class = nil

      @floating = false

      @static_field_class = "form-control-plaintext"

      @switch = false

      @wrapper = {}

      @size = nil

      @inline = false

      @label_col_class = "col-form-label"
      @label_col_wrapper_class = "col-sm-2"
      @field_col_wrapper_class = "col-sm-10"

      @render_as_button = false
    end
  end
end
