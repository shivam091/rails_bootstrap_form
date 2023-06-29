# RailsBootstrapForm

[![Ruby](https://github.com/shivam091/rails_bootstrap_form/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/shivam091/rails_bootstrap_form/actions/workflows/main.yml)
[![Gem Version](https://badge.fury.io/rb/rails_bootstrap_form.svg)](https://badge.fury.io/rb/rails_bootstrap_form)
[![Gem Downloads](https://img.shields.io/gem/dt/rails_bootstrap_form.svg)](http://rubygems.org/gems/rails_bootstrap_form)
[![Code Coverage](https://img.shields.io/badge/Code%20Coverage-100%25-success)](https://github.com/shivam091/rails_bootstrap_form/tree/main/coverage/coverage_percent.txt)
[![Maintainability](https://api.codeclimate.com/v1/badges/8038de955c10394ae35d/maintainability)](https://codeclimate.com/github/shivam091/rails_bootstrap_form/maintainability)

**rails_bootstrap_form** is a Rails form builder that makes it super easy to integrate [Bootstrap 5](https://getbootstrap.com/) forms into your Rails application.
`rails_bootstrap_form`'s form helpers generate the form field and its label along with all the Bootstrap mark-up required for proper Bootstrap display.

## Minimum Requirements

* Ruby 3.2.2+ (https://www.ruby-lang.org/en/downloads/branches/)
* Rails 7.0+ (https://guides.rubyonrails.org/maintenance_policy.html)
* Bootstrap 5.0+ (https://getbootstrap.com/docs/versions/)

## Installation

Install Bootstrap 5. There are many ways to do this, depending on the asset pipeline you're using in your Rails application.
One way is to use the gem that works with Sprockets. To do so, in a brand new Rails 7.0 application created _without_ the
`--webpacker` option, add the `bootstrap` gem to your `Gemfile`:

```ruby
gem "bootstrap", "~> 5.0"
```

And follow the remaining instructions in the [official bootstrap installation guide](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails)
for setting up `application.scss` and `application.js`.

Add the `rails_bootstrap_form` gem to your `Gemfile`:

```ruby
gem "rails_bootstrap_form", "~> 0.9.6"
```

Then:

`bundle install`

Depending on which CSS pre-processor you are using, adding the bootstrap form styles differs slightly.
If you use Rails in the default mode without any pre-processor, you'll have to add the following line to your `application.css` file:

```css
*= require rails_bootstrap_form
```

If you followed the [official bootstrap installation guide](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails),
you'll probably have switched to SCSS. In this case add the following line to your `application.scss`:

```scss
@import "rails_bootstrap_form";
```

## Configuration

`rails_bootstrap_form` can be used without any configuration. However, `rails_bootstrap_form` does have an optional configuration file at `config/initializers/rails_bootstrap_form.rb` for setting options that affect all generated forms in an application. This configuration file is created using the generator
by running the command:

```
$ rails generate rails_bootstrap_form:install
```

Example:

```ruby
# config/initializers/rails_bootstrap_form.rb
RailsBootstrapForm.configure do |config|
  # to make forms non-compliant with W3C.
  config.default_form_attributes = {novalidate: true}
end
```

The current configuration options are:

| Option | Default value | Description |
|---------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `default_form_attributes` | | Set this option to `{novalidate: true}` to instruct `rails_bootstrap_form` to skip all HTML 5 validation. |

## Usage

### bootstrap_form_for

To get started, use the `bootstrap_form_for` helper in place of the Rails [`form_for`](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_for) helper. Here's an example:

![bootstrap_form_for](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/dfc5f03b-049a-4c12-b575-8298cf5551d7)

```erb
<%= bootstrap_form_for(@user) do |f| %>
  <%= f.email_field :email %>
  <%= f.password_field :password %>
  <%= f.check_box :remember_me %>
  <%= f.primary "Log In" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="mb-3">
    <label class="form-label required" for="user_email">Email address</label>
    <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
  </div>
  <div class="mb-3">
    <label class="form-label required" for="user_password">Password</label>
    <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
  </div>
  <div class="mb-3">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms">
      <label class="form-check-label" for="user_terms">I accept terms and conditions</label>
      <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
    </div>
  </div>
  <input type="submit" name="commit" value="Log In" class="btn btn-primary" data-disable-with="Log In">
</form>
```

### bootstrap_form_with

To get started, use the `bootstrap_form_with` helper in place of the Rails [`form_with`](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_with) helper. Here's an example:

![bootstrap_form_with](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/06c605b9-29e2-4670-9495-0e913508d73f)

```erb
<%= bootstrap_form_with(model: @user) do |f| %>
  <%= f.email_field :email %>
  <%= f.password_field :password %>
  <%= f.check_box :remember_me %>
  <%= f.primary "Log In" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="mb-3">
    <label class="form-label required" for="user_email">Email address</label>
    <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
  </div>
  <div class="mb-3">
    <label class="form-label required" for="user_password">Password</label>
    <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
  </div>
  <div class="mb-3">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms">
      <label class="form-check-label" for="user_terms">I accept terms and conditions</label>
      <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
    </div>
  </div>
  <input type="submit" name="commit" value="Log In" class="btn btn-primary" data-disable-with="Log In">
</form>
```

## Bootstrap Configuration Options

Here's a list of all possible options you can pass via `bootstrap` option that can be attached to the `bootstrap_form_for`, `bootstrap_form_with`, `fields_for`, or any field helpers inside of it:

| Option | Description | Default value |
| ------ | ------------- | ----------- |
| `disabled` | An option to disable **rails_bootstrap_form** helpers. Default rails form builder element is rendered when set to `true` | `false` |
| `layout` | Controls layout of form and field helpers. It can be `vertical` `horizontal`, or `inline`. | `vertical` |
| `field_class` | A CSS class that will be applied to all form fields. | `nil` |
| `help_text` | Describes help text for the HTML field. Help text is automatically read from translation file. If you want to customize it, you can pass a string. You can also set it `false` if you do not want help text displayed. | `nil` |
| `label_text` | An option to customize automatically generated label text. | `nil` |
| `skip_label` | An option to control whether the label is to be displayed or not. | `false` |
| `hide_label` | An option to control whether the label is only accessible to a screen readers. | `false` |
| `hide_class` | A CSS class that will be used when the label is only accessible to a screen readers. | `visually-hidden` |
| `label_class` | A CSS class that will be applied to all labels when layout is `vertical`. | `form-label` |
| `additional_label_class` | An additional CSS class that will be added along with the existing label css classes. | `nil` |
| `prepend` | Raw or HTML content to be prepended to the field. | `nil` |
| `append` | Raw or HTML content to be appended to the field. | `nil` |
| `additional_input_group_class` | An additional CSS class that will be added to existing input group wrapper css classes. | `nil` |
| `floating` | An option to control whether the field should have a floating label. | `false` |
| `static_field_class` | A CSS class that will be applied to all static fields. | `form-control-plaintext` |
| `switch` | An option to control whether the check box should look like Bootstrap switches. | `false` |
| `wrapper` | An option to control the HTML attributes and options that will be added to a field wrapper. You can set it false if you don't the field to be rendered in a wrapper. | `{}` |
| `size` | An option to control the size of input groups, buttons, labels, and fields. It can be `sm` or `lg`. | `nil` |
| `inline` | An option to group checkboxes and radio buttons on the same horizontal row. If form layout is `inline`, this option doesn't get considered. | `false` |
| `label_col_class` | A CSS class that will be applied to all labels when layout is `horizontal`. | `col-form-label` |
| `label_col_wrapper_class` | A CSS class for label column when layout is `horizontal`. | `col-sm-2` |
| `field_col_wrapper_class` | A CSS class for field column when layout is `horizontal`. | `col-sm-10` |
| `render_as_button` | An option to render submit button using `<button type="submit">` instead of `<input type="submit">`. | `false` |

Options defined on the form level will apply to all field helpers. Options defined on field helpers takes precedence over form-level options.
Here's an example of a form where one field uses different layout:

![bootstrap_option_override](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/9d312870-033f-4bc4-922b-1b65df202352)

```erb
<%= bootstrap_form_for @user do |form| %>
  <%= form.text_field :name %>
  <%= form.email_field :email %>
  <%= form.password_field :password, bootstrap: {layout: :horizontal} %>
  <%= form.check_box :terms %>
  <%= form.primary "Register" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="mb-3">
    <label class="form-label required" for="user_name">Name</label>
    <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
  </div>
  <div class="mb-3">
    <label class="form-label required" for="user_email">Email address</label>
    <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_password">Password</label>
    <div class="col-sm-10">
      <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
    </div>
  </div>
  <div class="mb-3">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms">
      <label class="form-check-label" for="user_terms">I accept terms and conditions</label>
      <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
    </div>
  </div>
  <input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
</form>
```

### Disabling Bootstrap

You can completely disable bootstrap and use default form builder by passing `disabled: true` option. For example:

```erb
<%= form.text_field :username, bootstrap: {disabled: true} %>
```

This generates the following HTML:

```html
<input type="text" name="user[username]" id="user_username">
```

### Disabling wrapper

In some cases, you may need to disable the default wrapper. You can do this by passing `wrapper: false` option:

![wrapper_false](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/1693cf0f-7a30-494d-9fb5-394f4fb2c676)

```erb
<%= form.text_field :name, bootstrap: {wrapper: false} %>
```

This generates the following HTML:

```html
<label class="form-label required" for="user_name">Name</label>
<input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
```

### Add additional CSS class

You can use `additional_field_class` option at form or field level to add extra CSS classes to the fields.

```erb
<%= form.text_field :name, autocomplete: "new-name", bootstrap: {additional_field_class: "custom-class"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_name">Name</label>
  <input autocomplete="new-name" class="form-control custom-class" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
</div>
```

You can also use HTML `class` attribute to add additional CSS class to the single field:

```erb
<%= form.text_field :name, autocomplete: "new-name", class: "custom-class" %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_name">Name</label>
  <input autocomplete="new-name" class="form-control custom-class" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
</div>
```

Here `additional_field_class` option takes precedance over HTML `class` attribute:

```erb
<%= form.text_field :name, autocomplete: "new-name", bootstrap: {additional_field_class: "custom-class"}, class: "html-class" %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_name">Name</label>
  <input autocomplete="new-name" class="form-control custom-class" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
</div>
```

## Supported Form Helpers

This gem wraps most of the form field helpers. Here's the current list:

```
check_box                    collection_check_boxes       collection_radio_buttons
collection_select            color_field                  date_field
date_select                  datetime_field               datetime_local_field
datetime_select              email_field                  file_field
grouped_collection_select    hidden_field                 month_field
number_field                 password_field               phone_field
radio_button                 range_field                  rich_text_area
search_field                 select                       static_field
telephone_field              text_area                    text_field
time_field                   time_select                  time_zone_select
url_field                    week_field                   weekday_select
```

## Supported Form Layouts

### Vertical Layout

This layout is default layout for the form in which labels are above the fields. In this layout, labels and fields take 100% of the width.

Here's an example of how it looks like:

![vertical_layout](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/0795cad6-f2f9-4cc6-bb39-aace67156781)

```erb
<%= bootstrap_form_for @user do |form| %>
  <%= form.email_field :email %>
  <%= form.password_field :password %>
  <%= form.primary "Sign in" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="mb-3">
    <label class="form-label required" for="user_email">Email address</label>
    <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
  </div>
  <div class="mb-3">
    <label class="form-label required" for="user_password">Password</label>
    <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
  </div>
  <input type="submit" name="commit" value="Sign in" class="btn btn-primary" data-disable-with="Sign in">
</form>
```

### Horizontal Layout

If you want to align label and field side by side, you can use horizontal layout for the form.
You can optionally override `label_col_wrapper_class` and `field_col_wrapper_class` (they default to `col-sm-2` and `col-sm-10`) at either form level
or field level if want to customize space between label and field.

Here's an example of how it looks like by default:

![horizontal_layout](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/71493945-31d5-4917-83c2-8cb7b0825371)

```erb
<%= bootstrap_form_for @user, bootstrap: {layout: :horizontal} do |form| %>
  <%= form.email_field :email %>
  <%= form.password_field :password %>
  <%= form.primary "Sign in" %>
<% end %>
```
This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_email">Email address</label>
    <div class="col-sm-10">
      <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
    </div>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_password">Password</label>
    <div class="col-sm-10">
      <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
    </div>
  </div>
  <input type="submit" name="commit" value="Sign in" class="btn btn-primary" data-disable-with="Sign in">
</form>
```

The `label_col_wrapper_class` and `field_col_wrapper_class` css classes can also be customized per control:

![horizontal_form_custom_classes](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/ae5492f0-4a10-4f63-ae4d-9675bfb93226)

```erb
<%= bootstrap_form_for @user, bootstrap: {layout: :horizontal} do |form| %>
  <%= form.text_field :name %>
  <%= form.email_field :username, bootstrap: {label_col_wrapper_class: "col-sm-2", field_col_wrapper_class: "col-sm-6"} %>
  <%= form.password_field :password %>
  <%= form.fields_for :address, include_id: false do |address_form| %>
    <%= address_form.select :country_id, options_for_select(::Country.pluck(:name, :id), address_form.object.country_id),
        {include_blank: "Select Country"} %>
  <% end %>
  <%= form.primary "Register" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_name">Name</label>
    <div class="col-sm-10">
      <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
    </div>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2" for="user_username">Username</label>
    <div class="col-sm-6">
      <input class="form-control" type="email" name="user[username]" id="user_username">
    </div>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_password">Password</label>
    <div class="col-sm-10">
      <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
    </div>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_address_attributes_country_id">Country</label>
    <div class="col-sm-10">
      <select class="form-select" aria-required="true" required="required" name="user[address_attributes][country_id]" id="user_address_attributes_country_id">
        <option value="">Select Country</option>
        <option value="1">India</option>
        <option value="2">Ireland</option>
        <option value="3">United States</option>
        <option value="4">United Kingdom</option>
      </select>
    </div>
  </div>
  <input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
</form>
```

### Inline Layout

You may choose to render form elements in one line. Please note that this layout won't render all form elements perfectly. Things like errors messages and help text won't show up right.

Here's an example of how it looks like:

![inline_layout](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/644a08ec-b249-4e1c-8d61-5350e6649f11)

```erb
<%= bootstrap_form_for @user, bootstrap: {layout: :inline} do |form| %>
  <%= form.email_field :email %>
  <%= form.password_field :password %>
  <%= form.primary "Sign in" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user row row-cols-lg-auto g-3 align-items-center" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="col-12">
    <label class="form-label visually-hidden required" for="user_email">Email address</label>
    <input class="form-control" aria-required="true" required="required" placeholder="Email address" type="email" name="user[email]" id="user_email">
  </div>
  <div class="col-12">
    <label class="form-label visually-hidden required" for="user_password">Password</label>
    <input class="form-control" aria-required="true" required="required" placeholder="Password" type="password" name="user[password]" id="user_password">
  </div>
  <div class="col-12">
    <input type="submit" name="commit" value="Sign in" class="btn btn-primary" data-disable-with="Sign in">
  </div>
</form>
```

## Components

`rails_bootstrap_form` internally supports below components which act as helpers to build fields and their wrappers.

### Labels

By default, Rails takes label text from locale file. You can use `label_text` option to change label text
generated by the Rails.

![label_text](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/b6378a06-c8e0-4944-8e0c-940a25964062)

```erb
<%= form.password_field :password, bootstrap: {label_text: "New password"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_password">New password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

To hide a label, you can set `hide_label: true` option. This adds the `visually-hidden` class, which keeps your labels accessible
to those using screen readers.

![hide_label](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/512a16b9-6829-40a2-bf07-f087970c9dac)

```erb
<%= form.password_field :password, bootstrap: {hide_label: true} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label visually-hidden required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

To skip a label, you can set `skip_label: true` option. This will not render label in a field wrapper.

![skip_label](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/251e28ac-b98b-4e6a-8d55-8c0cb061e65a)

```erb
<%= form.password_field :password, bootstrap: {skip_label: true} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

To add additional CSS class to the label, you can use `additional_label_class` option.

![additional_label_class](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/b5ab4efe-2512-4ee4-9d35-99d3b7f78171)

```erb
<%= form.password_field :password, bootstrap: {additional_label_class: "text-danger"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label text-danger required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

### Help Text

The help text is useful when you want to provide helpful information about a field. By default, `rails_bootstrap_form` takes help text from locale file.
If you want to show information regarding any field, you need to add it in locale file of your application. You can also use HTML content for help text.

```yml
en:
  activerecord:
    help_texts:
      user:
        password: "A strong password should be at least twelve characters long with combination of uppercase letters, lowercase letters, numbers, and symbols"
```

![help_text_from_translation](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e6d94d8c-9b47-4940-b2e0-6f1efef5a720)

```erb
<%= form.password_field :password %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
  <div class="form-text text-muted">A strong password should be at least twelve characters long with combination of uppercase letters, lowercase letters, numbers, and symbols</div>
</div>
```

You can customize the help text using `help_text` option:

![help_text](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/cdfe0e3c-6fcd-45a4-9621-9f0341925a1c)

```erb
<%= form.password_field :password, bootstrap: {help_text: "Password should not be disclosed to anyone."} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
  <div class="form-text text-muted">Password should not be disclosed to anyone.</div>
</div>
```

You can also disable help text by setting `help_text: false` option:

![help_text_false](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/be1a229a-cffd-447d-b846-9b9588b1b25e)

```erb
<%= form.password_field :password, help_text: false %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

### Input Groups

Input groups allow prepending and appending arbitrary html or text to the field.

You can use `prepend` and/or `append` options to attach addons to input fields:

![input_group_addon](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e7fb8f52-558d-458d-a112-2ee3bab366db)

```erb
<%= form.number_field :expected_ctc, bootstrap: {prepend: "₹", append: ".00"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_expected_ctc">Expected CTC</label>
  <div class="input-group">
    <span class="input-group-text">₹</span>
    <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc">
    <span class="input-group-text">.00</span>
  </div>
</div>
```

If you want to attach multiple addons to the input, pass them as an array:

![input_group_multiple_addons](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/8a6179c2-0def-428a-8429-c97db2c4a567)

```erb
<%= form.number_field :expected_ctc, bootstrap: {prepend: ["Gross", "₹"], append: [".00", "per annum"]} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_expected_ctc">Expected CTC</label>
  <div class="input-group">
    <span class="input-group-text">Gross</span>
    <span class="input-group-text">₹</span>
    <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc">
    <span class="input-group-text">.00</span>
    <span class="input-group-text">per annum</span>
  </div>
</div>
```

You can also prepend and append buttons. Note that these buttons must contain the `btn` class to generate the correct markup.

![input_group_button](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/f0d1e22a-ca2b-42da-b99c-f3e7003d8c27)

```erb
<%= form.text_field :search, bootstrap: {append: form.secondary("Search")} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_search">Search</label>
  <div class="input-group">
    <input class="form-control" type="text" name="user[search]" id="user_search">
    <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
  </div>
</div>
```

To add additional CSS class to the input group wrapper, you can use `additional_input_group_class` option.

![additional_input_group_class](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/1814ec85-1efe-4ffc-ba87-c171d1b73e2c)

```erb
<%= form.number_field :expected_ctc, bootstrap: {prepend: "₹", append: ".00", additional_input_group_class: "custom-class"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_expected_ctc">Expected CTC</label>
  <div class="input-group custom-class">
    <span class="input-group-text">₹</span>
    <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc">
    <span class="input-group-text">.00</span>
  </div>
</div>
```

You can customize size of the input group using `size` option. Input group supports `sm` and `lg` values.

![input_group_size](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/b7236bd6-4dad-4142-b14e-f6325a612958)

```erb
<%= form.number_field :expected_ctc, bootstrap: {prepend: "₹", append: ".00", size: :sm} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_expected_ctc">Expected CTC</label>
  <div class="input-group input-group-sm">
    <span class="input-group-text">₹</span>
    <input class="form-control form-control-sm" type="number" name="user[expected_ctc]" id="user_expected_ctc">
    <span class="input-group-text">.00</span>
  </div>
</div>
```

## Form Helpers

Our form helpers accept the same arguments as the default Rails form helpers.
In order to apply addition options of `rails_bootstrap_form`, `bootstrap` object is passed in `options` argument of the helper.
Here's an example of how you pass the arguments for each form helper:

### check_box

Our `check_box` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-check_box).
except it don't accept a `block` as an argument and renders check box and label for you.

![check_box](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/5836650c-d536-4f4e-b768-75bca9dd7901)

```erb
<%= form.check_box :remember_me %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <div class="form-check">
    <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me">
    <label class="form-check-label" for="user_remember_me">Keep me signed in</label>
  </div>
</div>
```

You can set `switch: true` option if you want check box to look like switches.

![check_box_switch](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/20c493ce-7f2c-4ac9-a854-e1520cae6a54)

```erb
<%= form.check_box :remember_me, bootstrap: {switch: true} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <div class="form-check form-switch">
    <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me">
    <label class="form-check-label" for="user_remember_me">Keep me signed in</label>
  </div>
</div>
```

This helper also renders help text if `help_text` option is set or information of the field is added to the locale file:

![check_box_help_text](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/071a6ac3-112c-42d0-965f-cd7751fdff19)

```erb
<%= form.check_box :terms, required: true %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <div class="form-check">
    <input required="required" class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms">
    <label class="form-check-label required" for="user_terms">I accept terms and conditions</label>
    <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
  </div>
</div>
```

### color_field

Our `color_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-color_field).

![color_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/d83f8231-076f-48cc-b27c-4076d6be8ab6)

```erb
<%= form.color_field :favorite_color %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_favorite_color">Favorite color</label>
  <input class="form-control form-control-color" aria-required="true" required="required" value="#000000" type="color" name="user[favorite_color]" id="user_favorite_color">
</div>
```

### date_field

Our `date_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-date_field).

![date_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/ddab2730-4076-4d0d-91c8-08b1f231741b)

```erb
<%= form.date_field :interview_date %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_interview_date">Interview date</label>
  <input class="form-control" value="2023-05-08" type="date" name="user[interview_date]" id="user_interview_date">
</div>
```

### datetime_field

Our `datetime_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-datetime_field).

![datetime_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/3b311f50-927f-4aa6-974a-2f5d0d79ff4f)

```erb
<%= form.datetime_field :interview_datetime %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_interview_datetime">Interview date &amp; time</label>
  <input class="form-control" type="datetime-local" name="user[interview_datetime]" id="user_interview_datetime">
</div>
```

### datetime_local_field

Our `datetime_local_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-datetime_local_field).

![datetime_local_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/ec9241a4-aa6e-448f-8478-04dba1cb7c11)

```erb
<%= form.datetime_local_field :interview_datetime %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_interview_datetime">Interview date &amp; time</label>
  <input class="form-control" type="datetime-local" name="user[interview_datetime]" id="user_interview_datetime">
</div>
```

### email_field

Our `email_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-email_field).

![email_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/a9b61ca1-7eb9-47e4-9bb0-db9f964186e7)

```erb
<%= form.email_field :email %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_email">Email address</label>
  <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
</div>
```

### fields_for

Our `fields_for` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-fields_for).

`rails_bootstrap_form` allows us to set `bootstrap` option just like `bootstrap_form_for` and `bootstrap_form_with`. By setting this option on `fields_for`, it applies to all the fields defined for that nested form:

![fields_for](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/f515302f-a92a-4b5c-a444-af91cbb00dff)

```erb
<%= bootstrap_form_for @user do |form| %>
  <%= form.email_field :email, autocomplete: "new-email" %>
  <%= form.password_field :password, autocomplete: "new-password", bootstrap: {layout: :horizontal} %>
  <%= form.phone_field :mobile_number %>
  <%= form.fields_for :address, include_id: false, bootstrap: {layout: :horizontal} do |address_form| %>
    <%= address_form.select :country_id, options_for_select(::Country.pluck(:name, :id), address_form.object.country_id),
        {include_blank: "Select Country"} %>
  <% end %>
  <%= form.check_box :terms, required: true %>
  <%= form.primary "Register" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="mb-3">
    <label class="form-label required" for="user_email">Email address</label>
    <input autocomplete="new-email" class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
    <div class="form-text text-muted">Please use official email address</div>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_password">Password</label>
    <div class="col-sm-10">
      <input autocomplete="new-password" class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
    </div>
  </div>
  <div class="mb-3">
    <label class="form-label required" for="user_mobile_number">Mobile number</label>
    <input class="form-control" aria-required="true" required="required" type="tel" name="user[mobile_number]" id="user_mobile_number">
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_address_attributes_country_id">Country</label>
    <div class="col-sm-10">
      <select class="form-select" aria-required="true" required="required" name="user[address_attributes][country_id]" id="user_address_attributes_country_id">
        <option value="">Select Country</option>
        <option value="1">India</option>
        <option value="2">Ireland</option>
        <option value="3">United States</option>
        <option value="4">United Kingdom</option>
        <option value="5">Spain</option>
        <option value="6">France</option>
        <option value="7">Canada</option>
      </select>
    </div>
  </div>
  <div class="mb-3">
    <div class="form-check">
      <input required="required" class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms">
      <label class="form-check-label required" for="user_terms">I accept terms and conditions</label>
      <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
    </div>
  </div>
  <input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
</form>
```

By setting `bootstrap` option on `bootstrap_form_for` or `bootstrap_form_with`, this option also applies to all the fields defined in fields_for block:

![fields_for_horizontal](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/cb75e76b-e8a3-48f1-83a1-9eb150aa2466)

```erb
<%= bootstrap_form_for @user, bootstrap: {layout: :horizontal} do |form| %>
  <%= form.email_field :email, autocomplete: "new-email" %>
  <%= form.password_field :password, autocomplete: "new-password" %>
  <%= form.phone_field :mobile_number %>
  <%= form.fields_for :address, include_id: false do |address_form| %>
    <%= address_form.select :country_id, options_for_select(::Country.pluck(:name, :id), address_form.object.country_id),
        {include_blank: "Select Country"} %>
  <% end %>
  <%= form.check_box :terms, required: true %>
  <%= form.primary "Register" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_email">Email address</label>
    <div class="col-sm-10">
      <input autocomplete="new-email" class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
      <div class="form-text text-muted">Please use official email address</div>
    </div>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_password">Password</label>
    <div class="col-sm-10">
      <input autocomplete="new-password" class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
    </div>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_mobile_number">Mobile number</label>
    <div class="col-sm-10">
      <input class="form-control" aria-required="true" required="required" type="tel" name="user[mobile_number]" id="user_mobile_number">
    </div>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2 required" for="user_address_attributes_country_id">Country</label>
    <div class="col-sm-10">
      <select class="form-select" aria-required="true" required="required" name="user[address_attributes][country_id]" id="user_address_attributes_country_id">
        <option value="">Select Country</option>
        <option value="1">India</option>
        <option value="2">Ireland</option>
        <option value="3">United States</option>
        <option value="4">United Kingdom</option>
        <option value="5">Spain</option>
        <option value="6">France</option>
        <option value="7">Canada</option>
      </select>
    </div>
  </div>
  <div class="row mb-3">
    <div class="col-sm-10 offset-sm-2">
      <div class="form-check">
        <input name="user[terms]" type="hidden" value="0" autocomplete="off">
        <input required="required" class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms">
        <label class="form-check-label required" for="user_terms">I accept terms and conditions</label>
        <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
      </div>
    </div>
  </div>
  <input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
</form>
```

Options specified at the field level take precedence over those specified at the fields_for level, which take precedence over those specified at the form level.

### file_field

Our `file_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-file_field).

![file_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/d9d41696-b2aa-43f7-9698-d6c339b01de0)

```erb
<%= form.file_field :avatar %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_avatar">Avatar</label>
  <input class="form-control" type="file" name="user[avatar]" id="user_avatar">
</div>
```

### hidden_field

The `hidden_field` helper in `rails_bootstrap_form` calls the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-hidden_field) directly, and does no additional mark-up.

### month_field

Our `month_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-month_field).

![month_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/39627509-fd90-425b-b4c5-b0a2afdb59ae)

```erb
<%= form.month_field :birth_month %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_birth_month">Birth month</label>
  <input class="form-control" type="month" name="user[birth_month]" id="user_birth_month">
</div>
```

### number_field

Our `number_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-number_field).

![number_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/c9018601-991d-4589-bcc1-1a8fb3dc9c18)

```erb
<%= form.number_field :expected_ctc %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_expected_ctc">Expected CTC</label>
  <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc">
</div>
```

### password_field

Our `password_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-password_field).

![password_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/594696b4-a8b4-460d-a1ed-f27bc21bcbf0)

```erb
<%= form.password_field :password %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

### phone_field

Our `phone_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-phone_field).

![phone_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/44f2acec-2a01-4715-a26e-0ff98653fbaf)

```erb
<%= form.phone_field :mobile_number %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_mobile_number">Mobile number</label>
  <input class="form-control" aria-required="true" required="required" type="tel" name="user[mobile_number]" id="user_mobile_number">
</div>
```

### radio_button

Our `radio_button` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-radio_button).
This helper will render check box and label for you.

![radio_button](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/9afa4065-6eea-44a6-a5be-d2936d1d2f9c)

```erb
<%= form.radio_button :gender, :male, bootstrap: {label_text: "Male"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <div class="form-check">
    <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male">
    <label class="form-check-label" for="user_gender_male">Male</label>
  </div>
</div>
```

This helper also renders help text if `help_text` option is set or information of the field is added to the locale file:

![radio_button_help_text](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/2409e822-c1bd-499b-b80f-e2948acf3403)

```erb
<%= form.radio_button :gender, :male, bootstrap: {label_text: "Male", help_text: "Please select your gender"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <div class="form-check">
    <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male">
    <label class="form-check-label" for="user_gender_male">Male</label>
    <div class="form-text text-muted">Please select your gender</div>
  </div>
</div>
```

### range_field

Our `range_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-range_field).

![range_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/7173d6fe-9b6f-4d80-8a48-37e86e025661)

```erb
<%= form.range_field :excellence %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_excellence">Excellence</label>
  <input class="form-range" type="range" name="user[excellence]" id="user_excellence">
</div>
```

### rich_text_area

Our `rich_text_area` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-rich_text_area). This editor is also known as `Trix Editor`.

![rich_text_area](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e845ee05-79f2-4352-899e-f93decc9b16b)

```erb
<%= form.rich_text_area :life_story %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_life_story">Life story</label>
  <input type="hidden" name="user[life_story]" id="user_life_story_trix_input_user" autocomplete="off">
  <trix-toolbar id="trix-toolbar-1">
    <div class="trix-button-row">
      <span class="trix-button-group trix-button-group--text-tools" data-trix-button-group="text-tools">
        <button type="button" class="trix-button trix-button--icon trix-button--icon-bold" data-trix-attribute="bold" data-trix-key="b" title="Bold" tabindex="-1">Bold</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-italic" data-trix-attribute="italic" data-trix-key="i" title="Italic" tabindex="-1">Italic</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-strike" data-trix-attribute="strike" title="Strikethrough" tabindex="-1">Strikethrough</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-link" data-trix-attribute="href" data-trix-action="link" data-trix-key="k" title="Link" tabindex="-1">Link</button>
      </span>
      <span class="trix-button-group trix-button-group--block-tools" data-trix-button-group="block-tools">
        <button type="button" class="trix-button trix-button--icon trix-button--icon-heading-1" data-trix-attribute="heading1" title="Heading" tabindex="-1">Heading</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-quote" data-trix-attribute="quote" title="Quote" tabindex="-1">Quote</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-code" data-trix-attribute="code" title="Code" tabindex="-1">Code</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-bullet-list" data-trix-attribute="bullet" title="Bullets" tabindex="-1">Bullets</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-number-list" data-trix-attribute="number" title="Numbers" tabindex="-1">Numbers</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-decrease-nesting-level" data-trix-action="decreaseNestingLevel" title="Decrease Level" tabindex="-1">Decrease Level</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-increase-nesting-level" data-trix-action="increaseNestingLevel" title="Increase Level" tabindex="-1">Increase Level</button>
      </span>
      <span class="trix-button-group trix-button-group--file-tools" data-trix-button-group="file-tools">
        <button type="button" class="trix-button trix-button--icon trix-button--icon-attach" data-trix-action="attachFiles" title="Attach Files" tabindex="-1">Attach Files</button>
      </span>
      <span class="trix-button-group-spacer"></span>
      <span class="trix-button-group trix-button-group--history-tools" data-trix-button-group="history-tools">
        <button type="button" class="trix-button trix-button--icon trix-button--icon-undo" data-trix-action="undo" data-trix-key="z" title="Undo" tabindex="-1">Undo</button>
        <button type="button" class="trix-button trix-button--icon trix-button--icon-redo" data-trix-action="redo" data-trix-key="shift+z" title="Redo" tabindex="-1">Redo</button>
      </span>
    </div>
    <div class="trix-dialogs" data-trix-dialogs="">
      <div class="trix-dialog trix-dialog--link" data-trix-dialog="href" data-trix-dialog-attribute="href">
        <div class="trix-dialog__link-fields">
          <input type="url" name="href" class="trix-input trix-input--dialog" placeholder="Enter a URL…" aria-label="URL" required="" data-trix-input="" disabled="disabled">
          <div class="trix-button-group">
            <input type="button" class="trix-button trix-button--dialog" value="Link" data-trix-method="setAttribute">
            <input type="button" class="trix-button trix-button--dialog" value="Unlink" data-trix-method="removeAttribute">
          </div>
        </div>
      </div>
    </div>
  </trix-toolbar>
  <trix-editor class="trix-content form-control" id="user_life_story" input="user_life_story_trix_input_user" data-direct-upload-url="http://test.host/rails/active_storage/direct_uploads" data-blob-url-template="http://test.host/rails/active_storage/blobs/redirect/:signed_id/:filename" contenteditable="" role="textbox" aria-label="Life story Life story" trix-id="1" toolbar="trix-toolbar-1"></trix-editor>
</div>
```

### search_field

Our `search_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-search_field).

![search_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/b108c5d6-42b3-4fde-9717-dbb1cb8b8780)

```erb
<%= form.search_field :search %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_search">Search</label>
  <input class="form-control" type="search" name="user[search]" id="user_search">
</div>
```

### telephone_field

Our `telephone_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-telephone_field).

![telephone_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/0f8ded9b-4dc5-4dea-9d3e-c8850776a0d4)

```erb
<%= form.telephone_field :mobile_number %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_mobile_number">Mobile number</label>
  <input class="form-control" aria-required="true" required="required" type="tel" name="user[mobile_number]" id="user_mobile_number">
</div>
```

### text_field

Our `text_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-text_field).

![text_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/88bc6eb0-53a6-4f5a-8dce-8499e6b2259d)

```erb
<%= form.text_field :name %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_name">Name</label>
  <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
</div>
```

### text_area

Our `text_area` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-text_area).

![text_area](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/3dad9907-4cd1-4144-a596-2471cce3739b)

```erb
<%= form.text_area :street %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_street">Street</label>
  <textarea class="form-control" aria-required="true" required="required" name="user[street]" id="user_street"></textarea>
</div>
```

### time_field

Our `time_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-time_field).

![time_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/cbf1a798-acc5-49a9-94d3-f3462f15ebc9)

```erb
<%= form.time_field :interview_time %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_interview_time">Interview time</label>
  <input class="form-control" type="time" name="user[interview_time]" id="user_interview_time">
</div>
```

### url_field

Our `url_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-url_field).

![url_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/dfb8a3ab-a1b2-4ce8-a10b-619b3fb1a268)

```erb
<%= form.url_field :blog_url %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_blog_url">Blog URL</label>
  <input class="form-control" type="url" name="user[blog_url]" id="user_blog_url">
</div>
```

### week_field

Our `week_field` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-week_field).

![week_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/609d0c59-c5ff-497c-8461-fc289ab06d6f)

```erb
<%= form.week_field :winter_holiday_week %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_winter_holiday_week">Winter holiday week</label>
  <input class="form-control" type="week" name="user[winter_holiday_week]" id="user_winter_holiday_week">
</div>
```

## Form Options Helpers

Our form options helpers accept the same arguments as the default Rails form options helpers.
In order to apply addition options of `rails_bootstrap_form`, `bootstrap` object is passed in `options` argument of the helper.
Here's an example of how you pass the arguments for each form option helper:

### select

Our `select` helper accepts the same arguments as the [default Rails helper](http://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-select).
Here's an example of how you pass both options and html_options hashes:

![select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e21f092c-d439-4817-bba1-8ec0c21330c1)

```erb
<%= form.select :fruit_id, options_for_select(::Fruit.pluck(:name, :id), form.object.fruit_id), {include_blank: "Select fruit", bootstrap: {size: :sm, help_text: false}}, {onchange: "this.form.submit();"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
  <select onchange="this.form.submit();" class="form-select" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
    <option value="">Select fruit</option>
    <option value="1">Mango</option>
    <option value="2">Apple</option>
    <option value="3">Orange</option>
    <option value="4">Watermelon</option>
  </select>
</div>
```

### collection_select

Our `collection_select` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-collection_select).
Here's an example of how you pass both options and html_options hashes:

![collection_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/c3a24265-81a9-4d1b-aa01-2b066d2f8bc7)

```erb
<%= form.collection_select :fruit_id, ::Fruit.all, :id, :name, {include_blank: "Select fruit", bootstrap: {help_text: false}}, {selected: form.object.fruit_id, onchange: "this.form.submit();"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
  <select onchange="this.form.submit();" class="form-select" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
    <option value="">Select fruit</option>
    <option value="1">Mango</option>
    <option value="2">Apple</option>
    <option value="3">Orange</option>
    <option value="4">Watermelon</option>
  </select>
</div>
```

### grouped_collection_select

Our `grouped_collection_select` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-grouped_collection_select).
Here's an example of how you pass both options and html_options hashes:

![grouped_collection_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/d8f90065-3aa8-4d52-9c3e-0486324b3624)

```erb
<%= form.grouped_collection_select :city, ::Country.includes(:cities), :cities, :name, :id, :name, {include_blank: "Select city", bootstrap: {floating: true}}, {onchange: "this.form.submit();"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <div class="form-floating">
    <select onchange="this.form.submit();" class="form-select" aria-required="true" required="required" placeholder="City" name="user[city]" id="user_city">
      <option value="">Select city</option>
      <optgroup label="India">
        <option value="1">Mumbai</option>
        <option value="2">New Delhi</option>
        <option value="3">Kolkata</option>
        <option value="4">Chennai</option>
      </optgroup>
      <optgroup label="Ireland">
        <option value="5">Dublin</option>
        <option value="6">Galway</option>
        <option value="7">Cork</option>
        <option value="8">Belfast</option>
      </optgroup>
      <optgroup label="United States">
        <option value="9">New York</option>
        <option value="10">Los Angeles</option>
        <option value="11">San Francisco</option>
        <option value="12">Chicago</option>
      </optgroup>
      ...
      ...
    </select>
    <label class="form-label required" for="user_city">City</label>
  </div>
</div>
```

### time_zone_select

Our `time_zone_select` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-time_zone_select).
Here's an example of how you pass both options and html_options hashes:

![time_zone_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e161585c-1bbf-485c-9baf-c57b15258fe8)

```erb
<%= form.time_zone_select :timezone, ::ActiveSupport::TimeZone.all, {include_blank: "Select time zone", bootstrap: {label_text: "Preferred time zone"}}, {onchange: "this.form.submit();"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_timezone">Preferred time zone</label>
  <select onchange="this.form.submit();" class="form-select" name="user[timezone]" id="user_timezone">
    <option value="">Select time zone</option>
    <option value="International Date Line West">(GMT-12:00) International Date Line West</option>
    <option value="American Samoa">(GMT-11:00) American Samoa</option>
    <option value="Midway Island">(GMT-11:00) Midway Island</option>
    <option value="Hawaii">(GMT-10:00) Hawaii</option>
    <option value="Alaska">(GMT-09:00) Alaska</option>
    <option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
    <option value="Tijuana">(GMT-08:00) Tijuana</option>
    <option value="Arizona">(GMT-07:00) Arizona</option>
    ...
    ...
  </select>
</div>
```

### weekday_select

Our `weekday_select` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-weekday_select).
Here's an example of how you pass both options and html_options hashes:

![weekday_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e469a57d-3d22-4c9e-829b-4ba825593ae1)

```erb
<%= form.weekday_select :weekly_off, {selected: "Monday", bootstrap: {label_text: "Week off"}}, {onchange: "this.form.submit();"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_weekly_off">Week off</label>
  <select onchange="this.form.submit();" class="form-select" name="user[weekly_off]" id="user_weekly_off">
    <option selected="selected" value="Monday">Monday</option>
    <option value="Tuesday">Tuesday</option>
    <option value="Wednesday">Wednesday</option>
    <option value="Thursday">Thursday</option>
    <option value="Friday">Friday</option>
    <option value="Saturday">Saturday</option>
    <option value="Sunday">Sunday</option>
  </select>
</div>
```

### collection_check_boxes

This helper provides a way to create collection of check boxes. This helper accepts same arguments as [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-collection_check_boxes) except it don't accept a `block` as
an argument and takes care of rendering labels, check boxes, and wrapper for you. `collection_check_boxes` are rendered by default for multiple option selections, but you can turn them into single selections by passing `options[:multiple] = false`.

![collection_check_boxes](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/c92f5921-e572-4384-812e-31308e018f66)

```erb
<%= form.collection_check_boxes :skill_ids, ::Skill.all, :id, :name, {bootstrap: {layout: :horizontal, inline: true}, onchange: "this.form.submit();"}, {} %>
```

This generates the following HTML:

```html
<div class="row mb-3">
  <label class="col-form-label col-sm-2 required" for="user_skill_ids">Skills</label>
  <div class="col-sm-10">
    <div class="rails-bootstrap-forms-collection-check-boxes">
      <input value="" multiple="multiple" autocomplete="off" type="hidden" name="user[skill_ids][]" id="user_skill_ids">
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="1" name="user[skill_ids][]" id="user_skill_ids_1">
        <label class="form-check-label" for="user_skill_ids_1">Communication</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="2" name="user[skill_ids][]" id="user_skill_ids_2">
        <label class="form-check-label" for="user_skill_ids_2">Problem Solving</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="3" name="user[skill_ids][]" id="user_skill_ids_3">
        <label class="form-check-label" for="user_skill_ids_3">Leadership</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="4" name="user[skill_ids][]" id="user_skill_ids_4">
        <label class="form-check-label" for="user_skill_ids_4">Writing</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="5" name="user[skill_ids][]" id="user_skill_ids_5">
        <label class="form-check-label" for="user_skill_ids_5">Creativity</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="6" name="user[skill_ids][]" id="user_skill_ids_6">
        <label class="form-check-label" for="user_skill_ids_6">Time Management</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="7" name="user[skill_ids][]" id="user_skill_ids_7">
        <label class="form-check-label" for="user_skill_ids_7">Team Work</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="8" name="user[skill_ids][]" id="user_skill_ids_8">
        <label class="form-check-label" for="user_skill_ids_8">Negotiation</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="9" name="user[skill_ids][]" id="user_skill_ids_9">
        <label class="form-check-label" for="user_skill_ids_9">Decision Making</label>
      </div>
      <div class="form-check form-check-inline">
        <input onchange="this.form.submit();" class="form-check-input" type="checkbox" value="10" name="user[skill_ids][]" id="user_skill_ids_10">
        <label class="form-check-label" for="user_skill_ids_10">Management</label>
      </div>
    </div>
    <div class="form-text text-muted">Select your strong skills</div>
  </div>
</div>
```

_If form layout is inline, `collection_check_boxes` always render `inline` check boxes._

### collection_radio_buttons

This helper provides a way to create collection of radio buttons. This helper accepts same arguments as [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-collection_radio_buttons) except it don't accept a `block` as
an argument and takes care of rendering labels, radio button, and wrapper for you.

![collection_radio_buttons](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/798a8b0c-915a-40b1-9874-dd74f50d3695)

```erb
<%= form.collection_radio_buttons :fruit_id, ::Fruit.all, :id, :name, {checked: form.object.fruit_id, bootstrap: {layout: :horizontal, inline: true}}, {} %>
```

This generates the following HTML:

```html
<div class="row mb-3">
  <label class="col-form-label col-sm-2 required" for="user_fruit_id">Favorite fruit</label>
  <div class="col-sm-10">
    <div class="rails-bootstrap-forms-collection-radio-buttons">
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" value="1" name="user[fruit_id]" id="user_fruit_id_1">
        <label class="form-check-label" for="user_fruit_id_1">Mango</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" value="2" name="user[fruit_id]" id="user_fruit_id_2">
        <label class="form-check-label" for="user_fruit_id_2">Apple</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" value="3" name="user[fruit_id]" id="user_fruit_id_3">
        <label class="form-check-label" for="user_fruit_id_3">Orange</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" value="4" name="user[fruit_id]" id="user_fruit_id_4">
        <label class="form-check-label" for="user_fruit_id_4">Watermelon</label>
      </div>
    </div>
    <div class="form-text text-muted">Select your favorite fruit</div>
  </div>
</div>
```

_If form layout is inline, `collection_check_boxes` always render `inline` check boxes._

## Date Helpers

The multiple selects that the date and time helpers (`date_select`, `time_select`, `datetime_select`) generate are wrapped inside a `fieldset.rails-bootstrap-forms-[date|time|datetime]-select` tag.
This is because Bootstrap automatically styles our controls as blocks. This wrapper fixes this defining these selects as `inline-block` and a width of `auto`.
In order to apply addition options of `rails_bootstrap_form`, `bootstrap` object is passed in `options` argument of the helper.

### date_select

Our `date_select` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-date_select).
Here's an example of how you pass both options and html_options hashes:

![date_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/45fe5d72-43da-498e-a1c2-ac6729446bba)

```erb
<%= form.date_select :interview_date, {selected: form.object.interview_date, bootstrap: {label_text: "Choose interview date"}}, {onchange: "this.form.submit();"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_interview_date">Choose interview date</label>
  <fieldset class="rails-bootstrap-forms-date-select">
    <select id="user_interview_date_1i" name="user[interview_date(1i)]" onchange="this.form.submit();" class="form-select">
      <option value="2018">2018</option>
      <option value="2019">2019</option>
      <option value="2020">2020</option>
      <option value="2021">2021</option>
      <option value="2022">2022</option>
      <option value="2023" selected="selected">2023</option>
      ...
      ...
    </select>
    <select id="user_interview_date_2i" name="user[interview_date(2i)]" onchange="this.form.submit();" class="form-select">
      <option value="1">January</option>
      <option value="2">February</option>
      <option value="3">March</option>
      <option value="4">April</option>
      <option value="5" selected="selected">May</option>
      ...
      ...
    </select>
    <select id="user_interview_date_3i" name="user[interview_date(3i)]" onchange="this.form.submit();" class="form-select">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8" selected="selected">8</option>
      ...
      ...
    </select>
  </fieldset>
</div>
```

### time_select

Our `time_select` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-time_select).
Here's an example of how you pass both options and html_options hashes:

![time_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/2195922c-c7cc-48dc-9912-3ef3cbb8e017)

```erb
<%= form.time_select :interview_time, {selected: form.object.interview_time, bootstrap: {label_text: "Choose interview time"}}, {onchange: "this.form.submit();"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_interview_time">Choose interview time</label>
  <fieldset class="rails-bootstrap-forms-time-select">
    <input type="hidden" id="user_interview_time_1i" name="user[interview_time(1i)]" value="1" autocomplete="off">
    <input type="hidden" id="user_interview_time_2i" name="user[interview_time(2i)]" value="1" autocomplete="off">
    <input type="hidden" id="user_interview_time_3i" name="user[interview_time(3i)]" value="1" autocomplete="off">
    <select id="user_interview_time_4i" name="user[interview_time(4i)]" onchange="this.form.submit();" class="form-select">
      <option value="00">00</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      ...
      ...
    </select>
    :
    <select id="user_interview_time_5i" name="user[interview_time(5i)]" onchange="this.form.submit();" class="form-select">
      <option value="00">00</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      ...
      ...
    </select>
  </fieldset>
</div>
```

### datetime_select

Our `datetime_select` helper accepts the same arguments as the [default Rails helper](https://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-datetime_select).
Here's an example of how you pass both options and html_options hashes:

![datetime_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/c0e0cd83-d44a-4308-bfa9-e25a2a488d66)

```erb
<%= form.datetime_select :interview_datetime, {selected: form.object.interview_datetime, bootstrap: {label_text: "Choose interview date & time"}}, {onchange: "this.form.submit();"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_interview_datetime">Choose interview date &amp; time</label>
  <fieldset class="rails-bootstrap-forms-datetime-select">
    <select id="user_interview_datetime_1i" name="user[interview_datetime(1i)]" onchange="this.form.submit();" class="form-select">
      <option value="2018">2018</option>
      <option value="2019">2019</option>
      <option value="2020">2020</option>
      <option value="2021">2021</option>
      ...
      ...
    </select>
    <select id="user_interview_datetime_2i" name="user[interview_datetime(2i)]" onchange="this.form.submit();" class="form-select">
      <option value="1">January</option>
      <option value="2">February</option>
      <option value="3">March</option>
      <option value="4">April</option>
      ...
      ...
    </select>
    <select id="user_interview_datetime_3i" name="user[interview_datetime(3i)]" onchange="this.form.submit();" class="form-select">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      ...
      ...
    </select>
    —
    <select id="user_interview_datetime_4i" name="user[interview_datetime(4i)]" onchange="this.form.submit();" class="form-select">
      <option value="00">00</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      ...
      ...
    </select>
    :
    <select id="user_interview_datetime_5i" name="user[interview_datetime(5i)]" onchange="this.form.submit();" class="form-select">
      <option value="00">00</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      ...
      ...
    </select>
  </fieldset>
</div>
```

## Submit Buttons

`rails_bootstrap_form` allows to easily create submit button for the form. `rails_bootstrap_form` supports three color variants for submit buttons: `secondary`, `primary`, and `danger`. Submit buttons are supported in `vertical`, `horizontal`, and `inline` layout.
Submit buttons in inline form are wrapped inside `div.col-12` to properly align on small width devices.

![button_helpers](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/f41a013b-b8c9-4689-a079-b8b102084cf0)

```erb
<%= form.secondary "Search" %>
<%= form.primary "Register" %>
<%= form.danger "Delete" %>
```

This generates the following HTML:

```html
<input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
<input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
<input type="submit" name="commit" value="Delete" class="btn btn-danger" data-disable-with="Delete">
```

It is also possible to pass additional classes to the button helpers using HTML `class` attribute and that class will be
added along with default class of the submit helper.

![button_additional_class](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/d9493c36-5c18-4e2a-bb36-e8a947c16bfe)

```erb
<%= form.primary "Register", class: "register-button" %>
```

This generates the following HTML:

```html
<input type="submit" name="commit" value="Register" class="register-button btn btn-primary" data-disable-with="Register">
```

To render submit helper as a button helper, you can set `render_as_button: true` option or pass a block.

![render_as_button](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/dffd72d8-3acf-4029-be04-3bf7776e8d9c)

```erb
<%= form.primary "Register", bootstrap: {render_as_button: true} %>
<%= form.secondary do %>
  Sign in
<% end %>
```

This generates the following HTML:

```html
<button name="button" type="submit" class="btn btn-primary">Register</button>
<button name="button" type="submit" class="btn btn-secondary">
  Sign in
</button>
```

## Static controls

`rails_bootstrap_form` provides form helper `static_field` to render static controls which internally uses [text_field](#text_field) form helper.
It sets `readonly` and `disabled` attributes on the text field. By default, `static_field` applies `form-control-plaintext`
CSS class to the control but you can change it by using option `static_field_class`.

You can create a static controls like this:

![static_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/cb7cc64f-c405-4abb-8ca9-66fe4c2fff98)

```erb
<%= form.static_field :email %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_email">Email address</label>
  <input readonly="readonly" disabled="disabled" value="test@example.com" class="form-control-plaintext" aria-required="true" required="required" type="text" name="user[email]" id="user_email">
</div>
```

_`static_field` supports all the bootstrap options which are supported by `text_field`._

## Floating Labels

The `floating` option can be used to enable Bootstrap floating labels. This option is supported on text fields, text areas and dropdowns. Here's an example:

![floating_labels](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/3976629d-4717-47b0-ab91-9a16e6c9ed5f)

```erb
<%= bootstrap_form_for @user, bootstrap: {floating: true} do |form| %>
  <%= form.text_field :name %>
  <%= form.email_field :username %>
  <%= form.password_field :password %>
  <%= form.fields_for :address, include_id: false do |address_form| %>
    <%= address_form.text_area :street %>
    <%= address_form.select :country_id, options_for_select(::Country.pluck(:name, :id), address_form.object.country_id),
        {include_blank: "Select Country"} %>
  <% end %>
  <%= form.primary "Register" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="mb-3">
    <div class="form-floating">
      <input class="form-control" aria-required="true" required="required" placeholder="Name" type="text" name="user[name]" id="user_name">
      <label class="form-label required" for="user_name">Name</label>
    </div>
  </div>
  <div class="mb-3">
    <div class="form-floating">
      <input class="form-control" placeholder="Username" type="email" name="user[username]" id="user_username">
      <label class="form-label" for="user_username">Username</label>
    </div>
  </div>
  <div class="mb-3">
    <div class="form-floating">
      <input class="form-control" aria-required="true" required="required" placeholder="Password" type="password" name="user[password]" id="user_password">
      <label class="form-label required" for="user_password">Password</label>
    </div>
  </div>
  <div class="mb-3">
    <div class="form-floating">
      <textarea class="form-control" aria-required="true" required="required" placeholder="Street" name="user[address_attributes][street]" id="user_address_attributes_street"></textarea>
      <label class="form-label required" for="user_address_attributes_street">Street</label>
    </div>
  </div>
  <div class="mb-3">
    <div class="form-floating">
      <select class="form-select" aria-required="true" required="required" placeholder="Country" name="user[address_attributes][country_id]" id="user_address_attributes_country_id">
        <option value="">Select Country</option>
        <option value="1">India</option>
        <option value="2">Ireland</option>
        <option value="3">United States</option>
        <option value="4">United Kingdom</option>
      </select>
      <label class="form-label required" for="user_address_attributes_country_id">Country</label>
    </div>
  </div>
  <input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
</form>
```

_`rails_bootstrap_form` automatically disables floating labels for unsupported helpers._

## Validation and Errors

By default, `rails_bootstrap_form` generations in-line errors which appear below the field.

### Inline Errors

By default, fields that have validation errors will be outlined in red and the error will be displayed below the field. Here's an example:

![inline_errors](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/a1cef10d-ba21-4d97-97e7-919691e2afe3)

```erb
<%= bootstrap_form_for @user do |form| %>
  <%= form.email_field :email %>
  <%= form.password_field :password %>
  <%= form.primary "Register" %>
<% end %>
```

This generates the following HTML:

```html
<form role="form" novalidate="novalidate" class="new_user" id="new_user" action="/users" accept-charset="UTF-8" method="post">
  <div class="mb-3">
    <label class="form-label required is-invalid" for="user_email">Email address</label>
    <input class="form-control is-invalid" aria-required="true" required="required" type="email" name="user[email]" id="user_email">
    <div class="invalid-feedback">can't be blank</div>
    <div class="form-text text-muted">Please use official email address</div>
  </div>
  <div class="mb-3">
    <label class="form-label required is-invalid" for="user_password">Password</label>
    <input class="form-control is-invalid" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
    <div class="invalid-feedback">can't be blank</div>
  </div>
  <input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
</form>
```

Inline errors are also supported if the field is wrapped inside of input group and has floating label:

![floating_inline_errors](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/89deb618-3f06-463b-91fb-60c50794387c)

```erb
<%= form.text_field :expected_ctc, bootstrap: {floating: true, prepend: "$", append: "0.0"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <div class="input-group has-validation">
    <span class="input-group-text">$</span>
    <div class="form-floating is-invalid">
      <input class="form-control is-invalid" aria-required="true" required="required" placeholder="Expected CTC" type="text" value="" name="user[expected_ctc]" id="user_expected_ctc">
      <label class="form-label required is-invalid" for="user_expected_ctc">Expected CTC</label>
    </div>
    <span class="input-group-text">0.0</span>
    <div class="invalid-feedback">can't be blank</div>
  </div>
</div>
```

The `has-validation` CSS class is added to an input group when the field has errors.
The `is-invalid` CSS class is added to floating label container when field with floating label has errors.

## Required Fields

A label that is associated with a mandatory field is automatically annotated with a `required` CSS class. `rails_bootstrap_form` provides styling for required fields.
You're also free to add any appropriate CSS to style required fields as desired.

The label `required` class is determined based on the definition of a presence validator with the associated model attribute. Presently this is one of: `ActiveRecord::Validations::PresenceValidator` or `ActiveModel::Validations::PresenceValidator`.

In cases where this behaviour is undesirable, use the required option to force the class to be present or absent:

![required_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/d99043f0-c382-4597-81bb-e96f27033e65)

```
<%= form.date_field :birth_date, required: false %>
<%= form.url_field :blog_url, required: true %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_birth_date">Birth date</label>
  <input class="form-control" type="date" name="user[birth_date]" id="user_birth_date">
</div>
<div class="mb-3">
  <label class="form-label required" for="user_blog_url">Blog URL</label>
  <input required="required" class="form-control" aria-required="true" type="url" name="user[blog_url]" id="user_blog_url">
</div>
```

### Required `belongs_to` associations

Adding a form control for a `belongs_to` associated field will automatically pick up the associated presence validator.

![belongs_to_presence](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/feb279d8-a742-42c2-b13d-8e5a0f60dfa2)

```erb
<%= form.collection_radio_buttons :fruit_id, ::Fruit.all, :id, :name, {checked: form.object.fruit_id} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
  <div class="rails-bootstrap-forms-collection-radio-buttons">
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" value="1" name="user[fruit_id]" id="user_fruit_id_1">
      <label class="form-check-label" for="user_fruit_id_1">Mango</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" value="2" name="user[fruit_id]" id="user_fruit_id_2">
      <label class="form-check-label" for="user_fruit_id_2">Apple</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" value="3" name="user[fruit_id]" id="user_fruit_id_3">
      <label class="form-check-label" for="user_fruit_id_3">Orange</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" value="4" name="user[fruit_id]" id="user_fruit_id_4">
      <label class="form-check-label" for="user_fruit_id_4">Watermelon</label>
    </div>
  </div>
  <div class="form-text text-muted">Select your favorite fruit</div>
</div>
```

## Internationalization

`rails_bootstrap_form` follows standard rails conventions so it's i18n-ready. See more [here](http://guides.rubyonrails.org/i18n.html#translations-for-active-record-models)

## Other Tips

### Empty But Visible Labels

Some third party plug-ins require an empty but visible label on an input control. The `hide_label` option generates a label that won't appear on the screen, but it's considered invisible and therefore doesn't work with such a plug-in. An empty label (e.g. `""`) causes the underlying Rails helpers to generate a label based on the field's attribute's name.

The solution is to use a zero-width character for the label, or some other "empty" HTML. For example:

```erb
bootstrap: {label_text: "&#8203;".html_safe}
```

or

```erb
bootstrap: {label_text: "<span></span>".html_safe}
```

## Contributing

I welcome contributions. If you wish to contribute in `rails_bootstrap_form`, please review the [Contributing](/CONTRIBUTING.md) document first.

## License

Copyright 2023 [Harshal V. LADHE](https://github.com/shivam091), Released under the MIT License
