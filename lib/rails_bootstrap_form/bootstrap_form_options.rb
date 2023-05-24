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

    # An option to override automatically generated label text.
    # Default is `nil`.
    attr_accessor :label_text

    # An option to custmize whether the label is to be displayed or not.
    # Default is `false`.
    attr_accessor :skip_label

    # An option to customize whether the label is only visible to screen readers.
    # Default is `false`.
    attr_accessor :hide_label

    # The CSS class that will be used when the label is only accessible by screen
    # readers. Default is `visually-hidden`
    attr_accessor :hide_class

    # Default CSS class that will be applied to all label tags when layout is
    # vertical.
    # The default value is `form-label`.
    attr_accessor :label_class

    # An additional CSS class that will be added along with the existing
    # `label_class` of the label. Default is `nil`.
    attr_accessor :additional_label_class

    # Input group specific options. Input groups allow prepending and appending
    # arbitrary html or text to the field.
    #
    # Example:
    #
    #   form.text_field :dollars, bootstrap_form: {input_group: {prepend: "$", append: ".00"}}
    #   form.text_field :search, bootstrap_form: {input_group: {append: button_tag("Go", type: :submit, class: "btn btn-secondary")}}
    #
    # Raw or HTML content to be prepended to the field.
    # Default is `nil`.
    attr_accessor :prepend

    # Raw or HTML content to be appended to the field.
    # Default is `nil`.
    attr_accessor :append

    # Append additional CSS class added to the input group wrapper.
    # Default is `nil`.
    attr_accessor :additional_input_group_class

    # Option to control whether the field should have a floating label.
    # Default is false.
    attr_accessor :floating

    # Default CSS class that will be applied to all static fields.
    # Default is `form-control-plaintext`.
    attr_accessor :static_field_class

    # Option to control whether the check box should look like bootstrap switches.
    # Default is `false`.
    attr_accessor :switch

    # Controls the HTML attributes and options that will be added to the field wrapper.
    # Default is `{}`.
    attr_accessor :wrapper_options

    # Option to specify the size of input groups and fields.
    # The valid values are `sm` and `lg`. The default value is `nil`.
    attr_accessor :size

    # Option to render checkboxes and radio buttons inline.
    # The default value if `false`.
    #
    # Example:
    #   form.collection_radio_buttons :choices, ["yes", "no"], :to_s, :to_s, bootstrap_form: {inline: true}
    attr_accessor :inline

    # Default CSS class that will be applied to all label tags when layout is
    # horizontal.
    # The default value is `col-form-label`.
    attr_accessor :label_col_class

    # Default CSS class for label column when using horizontal form.
    # The default value is `col-sm-2`.
    attr_accessor :label_col_wrapper_class

    # Default CSS class for control column when using horizontal form.
    # The default value is `col-sm-10`.
    attr_accessor :field_col_wrapper_class

    # Option to render submit button using `<button type="submit">` instead of
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
    #     f.text_field :email, bootstrap_form: {label_col_wrapper_class: "col-md-6", field_col_wrapper_class: "col-md-6"}
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

    %i(inline floating switch skip_label hide_label render_as_button).each do |method|
      define_method("#{method}?") { self.send(method) }
    end

    def set_defaults
      @layout = "vertical"

      @field_class = "form-control"
      @additional_field_class = nil

      @help_text = nil

      @label_text = nil
      @skip_label = false
      @hide_label = false
      @hide_class = "visually-hidden"
      @label_class = "form-label"
      @additional_label_class = nil

      @floating = false

      @static_field_class = "form-control-plaintext"

      @switch = false

      @wrapper_options = {}

      @size = nil

      @inline = false

      @label_col_class = "col-form-label"
      @label_col_wrapper_class = "col-sm-2"
      @field_col_wrapper_class = "col-sm-10"

      @render_as_button = false
    end

    private :set_defaults
  end
end
