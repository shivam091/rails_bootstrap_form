# Change Log

You can find recent releases with docs in GitHub:

https://github.com/shivam091/rails_bootstrap_form/releases

## [0.9.6](https://github.com/shivam091/rails_bootstrap_form/compare/v0.9.5...v0.9.6) - 2023-06-25

### What's new

- Integrated `importmap` and `actiontext` in demo application for demonstrating implementation of `rich_text_area`.
- Added spec examples for `date_field`, `datetime_field`, `datetime_local_field`, `datetime_select`, `email_field`,
  `file_field`, `hidden_field`, `month_field`, `number_field`, `password_field`, `phone_field`, `search_field`,
  `telephone_field`, `text_area`, `time_field`, `time_select`, `url_field`, and `week_field` helpers.

## [0.9.5](https://github.com/shivam091/rails_bootstrap_form/compare/v0.9.4...v0.9.5) - 2023-06-21

### What's changed

- Changed default value of `field_class` option to `nil`.

### What's fixed

- Fixed static field options to accept bootstrap options ([#45](https://github.com/shivam091/rails_bootstrap_form/issues/45))
- Changes to allow overriding of field_class at form and field level ([#44](https://github.com/shivam091/rails_bootstrap_form/issues/44))
- Fixed bug causing class attribute in select list to not get added to field ([#46](https://github.com/shivam091/rails_bootstrap_form/issues/46))

## [0.9.4](https://github.com/shivam091/rails_bootstrap_form/compare/v0.9.3...v0.9.4) - 2023-06-17

### What's new

- Added specs for field helpers.

### What's changed

- Change to take `additional_field_class` precedence over HTML `class` ([#42](https://github.com/shivam091/rails_bootstrap_form/issues/42))
- Change to `collection_check_boxes` and `collection_radio buttons` to render inline `check boxes` and
  `radio buttons`, respectively when form layout is inline. ([#43](https://github.com/shivam091/rails_bootstrap_form/issues/43))

### What's fixed

- Fixed bug causing `skip_label` option not to work in `radio_button` and `check_box` ([#37](https://github.com/shivam091/rails_bootstrap_form/issues/37))
- Fixed bug causing `additional_field_class` to apply on `radio_button` and `check_box` ([#40](https://github.com/shivam091/rails_bootstrap_form/issues/40))
- Fixed bug causing `bootstrap` options to not set on `static_field` ([#41](https://github.com/shivam091/rails_bootstrap_form/issues/41))

## [0.9.3](https://github.com/shivam091/rails_bootstrap_form/compare/v0.9.2...v0.9.3) - 2023-06-04

### What's changed

- Disabled floating labels for unsupported helpers

### What's fixed

- `id` of check box field when used in collection and don't has multiple select. (`collection_check_boxes` with `multiple: false`)

## [0.9.2](https://github.com/shivam091/rails_bootstrap_form/compare/v0.9.1...v0.9.2) - 2023-06-03

### What's new

- Added support to disable wrapper by passing option `wrapper: false`.

### What's fixed

- Changes to not showing required `asterisk` in `collection_check_boxes` and `collection_radio_buttons` helper ([#34](https://github.com/shivam091/rails_bootstrap_form/issues/34)).

### What's changed

- Wrappers of `check_box`, `collection_check_boxes`, `radio_button`, and `collection_radio_buttons` helpers.

## [0.9.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.9.0...v0.9.1) - 2023-06-02

### What's new

- Allow user to configure `options[:multiple]` for `collection_check_boxes`.
- Added option `inline` to control inline rendering of `collection_check_boxes` and `collection_radio_buttons`.

### What's changed

- `wrapper[:class]` will now be appended to existing field wrapper CSS classes ([#29](https://github.com/shivam091/rails_bootstrap_form/issues/29))

## [0.9.0](https://github.com/shivam091/rails_bootstrap_form/compare/v0.8.3...v0.9.0) - 2023-05-31

### What's new

- Added `disabled` option to allow user to render default Rails form builder element.

### BREAKING CHANGES

- Renamed `wrapper_options` option to `wrapper`
- Renamed `bootstrap_form` option to `bootstrap`

## [0.8.3](https://github.com/shivam091/rails_bootstrap_form/compare/v0.8.2...v0.8.3) - 2023-05-29

### What's new

- Added support to specify `bootstrap` option on `fields_for` helper ([#30](https://github.com/shivam091/rails_bootstrap_form/issues/30))

## [0.8.2](https://github.com/shivam091/rails_bootstrap_form/compare/v0.8.1...v0.8.2) - 2023-05-28

### What's fixed

- Fixed error causing `fields_for` to fail when object is passed in method.

## [0.8.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.8.0...v0.8.1) - 2023-05-28

### What's new

- Updated README
- Added support to add `required` class to label depending on field's `required` option
- Added specs for `Labels`, `HelpText`, `InputGroupBuilder`, and `inline` form layout

### What's changed
- Replaced `div` by `fieldset` for dropdowns of `date_select`, `time_select`, and `datetime_select`
- Removed block parameter from `collection_check_boxes` and `collection_radio_buttons`

## [0.8.0](https://github.com/shivam091/rails_bootstrap_form/compare/v0.7.2...v0.8.0) - 2023-05-26

### What's new
- Added support for `inline` layout for forms.

## [0.7.2](https://github.com/shivam091/rails_bootstrap_form/compare/v0.7.1...v0.7.2) - 2023-05-25

### What's new
- Added wrapper method for `rich_text_area`.

## [0.7.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.7.0...v0.7.1) - 2023-05-24

### What's new
- Added wrapper method for `weekday_select`.

## [0.7.0](https://github.com/shivam091/rails_bootstrap_form/compare/v0.6.2...v0.7.0) - 2023-05-24

### What's new
- Added helper methods for rendering submit buttons on forms.

## [0.6.2](https://github.com/shivam091/rails_bootstrap_form/compare/v0.6.1...v0.6.2) - 2023-05-24

### What's fixed
- Added support for setting bootstrap options of parent form to `fields_for` ([#10](https://github.com/shivam091/rails_bootstrap_form/issues/10))
- Ignore skip_label option when field has floating labels ([#9](https://github.com/shivam091/rails_bootstrap_form/issues/9))

## [0.6.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.6.0...v0.6.1) - 2023-05-24

### What's changed
- Changes in directory structure
- Added test cases
- Added README and CHANGELOG

## [0.6.0](https://github.com/shivam091/rails_bootstrap_form/compare/v0.5.3...v0.6.0) - 2023-05-22

### What's new
- Added support for **`horizontal`** form layout

## [0.5.3](https://github.com/shivam091/rails_bootstrap_form/compare/v0.5.2...v0.5.3) - 2023-05-21

### What's changed
- Added new option inline to render checkboxes and radio buttons inline

## [0.5.2](https://github.com/shivam091/rails_bootstrap_form/compare/v0.5.1...v0.5.2) - 2023-05-21

### What's new
- Added option to add custom options to the field's wrapper
- Added option to apply user defined CSS class to the field
- Added option to control size of input group and field
- Added provision to change id of the field and corresponding label

### What's changed
- Added `mb-3` css class to field wrapper if radio buttons or check boxes are not inline

## [0.5.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.5.0...v0.5.1) - 2023-05-20

### What's new
- Wrapped `collection_check_boxes` and `collection_radio_buttons` inside field wrapper.

## [0.5.0](https://github.com/shivam091/rails_bootstrap_form/compare/v0.4.2...v0.5.0) - 2023-05-20

### What's new
- Added wrapper methods for `check_box`, `collection_check_boxes`, `radio_button`, and `collection_radio_buttons` to support Bootstrap 5 form styles

### What's changed
- Replaced HTML tag of help_text component from `<span>` to `<div>`

## [0.4.2](https://github.com/shivam091/rails_bootstrap_form/compare/v0.4.1...v0.4.2) - 2023-05-16

### What's new
- Added wrapper method for `grouped_collection_select`

## [0.4.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.4.0...v0.4.1) - 2023-05-16

### What's fixed
- Replaced `reverse_merge` by `deep_merge!` in adding new option values to fix bug causing not to merge options.

## [0.4.0](https://github.com/shivam091/rails_bootstrap_form/compare/v0.3.1...v0.4.0) - 2023-05-15

### What's new
- Added wrapper methods for `range_field` and `color_field`
- Added wrapper methods for `time_zone_select` and `hidden_field`
- Added wrapper methods for `date_select`, `time_select`, and `datetime_select`
- Added wrapper method to render static control
- Added wrapper method for `collection_select`

## [0.3.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.3.0...v0.3.1) - 2023-05-15

### What's fixed
- Bug causing fields to wrap in input group even when content to append and prepend is not available.

## [0.3.0](https://github.com/shivam091/rails_bootstrap_form/compare/v0.2.3...v0.3.0) - 2023-05-15

### What's new
- Added support to wrap field in input group
- Added support to display error messages below the field
- Added support for floating labels for inputs.

## [0.2.3](https://github.com/shivam091/rails_bootstrap_form/compare/v0.2.2...v0.2.3) - 2023-05-15

### What's new
- Added component to mark labels as required

## [0.2.2](https://github.com/shivam091/rails_bootstrap_form/compare/v0.2.1...v0.2.2) - 2023-05-15

### What's new
- Added support to display labels along with the field.

## [0.2.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.2.0...v0.2.1) - 2023-05-15

### What's new
- Added FieldWrapperBuilder to create wrapper for placing fields and other related components
- Added support to display help text along with the field
- Added wrapper methods for simple form fields

## [0.2.0](https://github.com/shivam091/rails_bootstrap_form/compare/v0.1.1...v0.2.0) - 2023-05-15

### What's new
- Added PORO class `BootstrapFormOptions` to maintain gem specific configuration.
- Added BoostrapFormBuilder and extension methods for Rails form builder.
- Added required models, controllers, and views in demo application.

## [0.1.1](https://github.com/shivam091/rails_bootstrap_form/compare/v0.1.0...v0.1.1) - 2023-05-15

### What's new
- Initialized demo application for demonstrating the working.
- Added generater to copy initializer file required for maintaining global configuration.
- Added Configuration class to maintain configurable options.

## 0.1.0 - 2023-05-15

- Initial release

## [Unreleased]
