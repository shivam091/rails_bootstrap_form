# RailsBootstrapForm

**rails_bootstrap_form** is a Rails form builder that makes it super easy to integrate
[Bootstrap 5](https://getbootstrap.com/) forms into your Rails application.
`rails_bootstrap_forms`'s form helpers generate the form field and its label and
all the Bootstrap mark-up required for proper Bootstrap display.

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
gem "rails_bootstrap_form", "~> 0.7.2"
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
by running the command on the terminal.

```
$ rails generate rails_bootstrap_form:install
```

Example:

```ruby
# config/initializers/rails_bootstrap_form.rb
RailsBootstrapForm.configure do |config|
  # to make forms non-compliant with W3C.
  config.default_form_attributes = {role: "form", novalidate: true}
end
```

The current configuration options are:

| Option | Default value | Description |
|---------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `default_form_attributes` | | Set this option to `{role: "form"}` to make forms non-compliant with W3C, but generate the `role="form"` attribute. |

## Usage

### bootstrap_form_for

To get started, use the `bootstrap_form_for` helper in place of the Rails `form_for` helper. Here's an example:

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
  <div class="form-check mb-3">
    <input name="user[remember_me]" type="hidden" value="0" autocomplete="off">
    <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me">
    <label class="form-check-label" for="user_remember_me">Remember me</label>
  </div>
  <input type="submit" name="commit" value="Log In" class="btn btn-primary" data-disable-with="Log In">
</form>
```

### bootstrap_form_with

To get started, use the `bootstrap_form_with` helper in place of the Rails `form_with` helper. Here's an example:

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
  <div class="form-check mb-3">
    <input name="user[remember_me]" type="hidden" value="0" autocomplete="off">
    <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me">
    <label class="form-check-label" for="user_remember_me">Remember me</label>
  </div>
  <input type="submit" name="commit" value="Log In" class="btn btn-primary" data-disable-with="Log In">
</form>
```

## Bootstrap configuration options

Here's a list of all possible options you can pass via `bootstrap_form` option that can be attached to the `bootstrap_form_for` or `bootstrap_form_with` or any field helpers inside of it:

| Option | Description | Default value |
| ------ | ------------- | ----------- |
| `layout` | Controls layout of form and field helpers. It can be `vertical` `horizontal`, or `inline`. | `vertical` |
| `field_class` | A CSS class that will be applied to all form fields. | `form-control` |
| `additional_field_class` | An additional CSS class that will be added along with the existing css classes of field helpers. | `nil` |
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
| `wrapper_options` | An option to control the HTML attributes and options that will be added to a field wrapper. | `{}` |
| `size` | An option to control the size of input groups, buttons, labels, and fields. It can be `sm` or `lg`. | `nil` |
| `inline` | An option to group checkboxes and radio buttons on the same horizontal row. | `false` |
| `label_col_class` | A CSS class that will be applied to all labels when layout is `horizontal`. | `col-form-label` |
| `label_col_wrapper_class` | A CSS class for label column when layout is `horizontal`. | `col-sm-2` |
| `field_col_wrapper_class` | A CSS class for field column when layout is `horizontal`. | `col-sm-10` |
| `render_as_button` | An option to render submit button using `<button type="submit">` instead of `<input type="submit">`. | `false` |

Options applied on the form level will apply to all field helpers. Options applied on field helpers will override form-level options.
Here's an example of a form where one field uses different layout:

![bootstrap_option_override](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/9d312870-033f-4bc4-922b-1b65df202352)

```erb
<%= bootstrap_form_for @user do |form| %>
  <%= form.text_field :name %>
  <%= form.email_field :email %>
  <%= form.password_field :password, bootstrap_form: {layout: :horizontal} %>
  <%= form.check_box :terms, required: true %>
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
  <div class="form-check mb-3">
    <input name="user[terms]" type="hidden" value="0" autocomplete="off">
    <input required="required" class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms">
    <label class="form-check-label required" for="user_terms">I accept terms and conditions</label>
    <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
  </div>
  <input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
</form>
```

## Supported form helpers

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

## Supported form layouts

### Vertical layout

This layout is default layout for the form in which labels are above the fields and labels and fields take 100% of the width.

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

### Horizontal layout

If you want to align label and field side by side, you can use horizontal layout for the form.
You can optionally override `label_col_wrapper_class` and `field_col_wrapper_class` at either form level or field helpers if want to customize
space between label and field.

Here's an example of how it looks like by default:

![horizontal_layout](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/71493945-31d5-4917-83c2-8cb7b0825371)

```erb
<%= bootstrap_form_for @user, bootstrap_form: {layout: :horizontal} do |form| %>
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

### Inline layout

You may choose to render form elements in one line. Please note that this layout won't render all form elements perfectly. Things like errors messages and help text won't show up right.

Here's an example of how it looks like:

![inline_layout](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/644a08ec-b249-4e1c-8d61-5350e6649f11)

```erb
<%= bootstrap_form_for @user, bootstrap_form: {layout: :inline} do |form| %>
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

## Labels

By default, Rails takes label text from locale file. You can use `label_text` option to change label text
generated by the Rails.

![label_text](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/b6378a06-c8e0-4944-8e0c-940a25964062)

```erb
<%= form.password_field :password, bootstrap_form: {label_text: "New password"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_password">New password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

To hide a label, you can set `hide_label` option to `true`. This adds the `visually-hidden` class, which keeps your labels accessible
to those using screen readers.

![hide_label](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/512a16b9-6829-40a2-bf07-f087970c9dac)

```erb
<%= form.password_field :password, bootstrap_form: {hide_label: true} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label visually-hidden required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

To skip a label, you can set `skip_label` option to `true`. This will not render label in a field wrapper.

![skip_label](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/251e28ac-b98b-4e6a-8d55-8c0cb061e65a)

```erb
<%= form.password_field :password, bootstrap_form: {skip_label: true} %>
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
<%= form.password_field :password, bootstrap_form: {additional_label_class: "text-danger"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label text-danger required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
</div>
```

## Help text

The help text is useful when you want to provide information about a field. By default, `rails_bootstrap_form` takes help text from locale file.
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

You can also customize the help text using `help_text` option:

![help_text](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/cdfe0e3c-6fcd-45a4-9621-9f0341925a1c)

```erb
<%= form.password_field :password, bootstrap_form: {help_text: "Password should not be disclosed to anyone."} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_password">Password</label>
  <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password">
  <div class="form-text text-muted">Password should not be disclosed to anyone.</div>
</div>
```

You can also disable help text by setting `help_text` option to `false`:

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

## Submit buttons

`rails_bootstrap_form` allows to easily create submit button for the form. `rails_bootstrap_form` supports three color variants for submit buttons: `secondary`, `primary`, and `danger`.

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

To render submit helper as a button helper, you can set `render_as_button` option to `true` or pass a block.

![render_as_button](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/dffd72d8-3acf-4029-be04-3bf7776e8d9c)

```erb
<%= form.primary "Register", bootstrap_form: {render_as_button: true} %>
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

## Input groups

Input groups allow prepending and appending arbitrary html or text to the field.

You can `prepend` and/or `append` addons to input fields:

![input_group](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/ef965d72-c424-4c1f-b677-ba4721ab4dfb)

```erb
<%= form.text_field :price, bootstrap_form: {prepend: "₹", append: ".00"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="product_price">Price</label>
  <div class="input-group">
    <span class="input-group-text">₹</span>
    <input class="form-control" type="text" name="product[price]" id="product_price">
    <span class="input-group-text">.00</span>
  </div>
</div>
```

If you want to attach multiple addons to the input, pass them as an array:

![input_group_multiple_addons](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/8cf62ca0-8bbf-4e46-8f54-61c9eedd6de4)

```erb
<%= form.text_field :price, bootstrap_form: {prepend: ["Net", "₹"], append: [".00", "per day"]} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="product_price">Price</label>
  <div class="input-group">
    <span class="input-group-text">Net</span>
    <span class="input-group-text">₹</span>
    <input class="form-control" type="text" name="product[price]" id="product_price">
    <span class="input-group-text">.00</span>
    <span class="input-group-text">per day</span>
  </div>
</div>
```

You can also prepend and append buttons. Note that these buttons must contain the `btn` class to generate the correct markup.

![input_group_button](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/f0d1e22a-ca2b-42da-b99c-f3e7003d8c27)

```erb
<%= form.text_field :search, bootstrap_form: {append: form.secondary("Search")} %>
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

![additional_input_group_class](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/5e9ed2b2-8775-4f14-a921-762eac0e2edb)

```erb
<%= form.text_field :price, bootstrap_form: {prepend: "₹", append: ".00", additional_input_group_class: "custom-class"} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_price">Price</label>
  <div class="input-group custom-class">
    <span class="input-group-text">₹</span>
    <input class="form-control" type="text" name="user[price]" id="user_price">
    <span class="input-group-text">.00</span>
  </div>
</div>
```

You can customize size of the input group using `size` option. Input group supports `sm` and `lg` values.

![input_group_size](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/26122741-2c62-433e-9df9-05a9aa3de93c)

```erb
<%= form.text_field :price, bootstrap_form: {prepend: "₹", append: ".00", size: :sm} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_price">Price</label>
  <div class="input-group input-group-sm">
    <span class="input-group-text">₹</span>
    <input class="form-control form-control-sm" type="text" name="user[price]" id="user_price">
    <span class="input-group-text">.00</span>
  </div>
</div>
```

## Field helpers

Our field helpers accept the same arguments as the default Rails helpers. Here's an example of how you pass the arguments for each field helper:

### select

![select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e21f092c-d439-4817-bba1-8ec0c21330c1)

```erb
<%= form.select :fruit_id, options_for_select(::Fruit.pluck(:name, :id), form.object.fruit_id), {include_blank: "Select fruit", bootstrap_form: {size: :sm, help_text: false}}, {} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
  <select class="form-select form-select-sm" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
    <option value="">Select fruit</option>
    <option value="1">Mango</option>
    <option value="2">Apple</option>
    <option value="3">Orange</option>
    <option value="4">Watermelon</option>
  </select>
</div>
```

### collection_select

![collection_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/c3a24265-81a9-4d1b-aa01-2b066d2f8bc7)

```erb
<%= form.collection_select :fruit_id, ::Fruit.all, :id, :name, {include_blank: "Select fruit", bootstrap_form: {help_text: false}}, {selected: form.object.fruit_id} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
  <select class="form-select" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
    <option value="">Select fruit</option>
    <option value="1">Mango</option>
    <option value="2">Apple</option>
    <option value="3">Orange</option>
    <option value="4">Watermelon</option>
  </select>
</div>
```

### grouped_collection_select

![grouped_collection_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/d8f90065-3aa8-4d52-9c3e-0486324b3624)

```erb
<%= form.grouped_collection_select :city, ::Country.includes(:cities), :cities, :name, :id, :name, {include_blank: "Select city", bootstrap_form: {floating: true}}, {} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <div class="form-floating">
    <select class="form-select" aria-required="true" required="required" placeholder="City" name="user[city]" id="user_city">
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

![time_zone_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e161585c-1bbf-485c-9baf-c57b15258fe8)

```erb
<%= form.time_zone_select :timezone, ::ActiveSupport::TimeZone.all, {include_blank: "Select time zone", bootstrap_form: {label_text: "Preferred time zone"}}, {} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_timezone">Preferred time zone</label>
  <select class="form-select" name="user[timezone]" id="user_timezone">
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

### date_select

![date_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/03c441ca-efe6-4740-b37e-d1a8d0898c67)

```erb
<%= form.date_select :appointment_date, {selected: Date.today, bootstrap_form: {label_text: "Choose Appointment date"}}, {} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_appointment_date">Choose Appointment date</label>
  <div class="rails-bootstrap-forms-date-select">
    <select id="user_appointment_date_1i" name="user[appointment_date(1i)]" class="form-select">
      <option value="2018">2018</option>
      <option value="2019">2019</option>
      <option value="2020">2020</option>
      <option value="2021">2021</option>
      <option value="2022">2022</option>
      <option value="2023" selected="selected">2023</option>
      ...
      ...
    </select>
    <select id="user_appointment_date_2i" name="user[appointment_date(2i)]" class="form-select">
      <option value="1">January</option>
      <option value="2">February</option>
      <option value="3">March</option>
      <option value="4">April</option>
      <option value="5" selected="selected">May</option>
      ...
      ...
    </select>
    <select id="user_appointment_date_3i" name="user[appointment_date(3i)]" class="form-select">
      ...
      ...
      <option value="27" selected="selected">27</option>
      <option value="28">28</option>
      <option value="29">29</option>
      <option value="30">30</option>
      <option value="31">31</option>
    </select>
  </div>
</div>
```

### time_select

![time_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/5c536058-1f26-4f0a-98e5-8926cb0fc832)

```erb
<%= form.time_select :appointment_time, {selected: Time.now, bootstrap_form: {label_text: "Choose appointment time"}}, {} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_appointment_time">Choose appointment time</label>
  <div class="rails-bootstrap-forms-time-select">
    <input type="hidden" id="user_appointment_time_1i" name="user[appointment_time(1i)]" value="2023" autocomplete="off">
    <input type="hidden" id="user_appointment_time_2i" name="user[appointment_time(2i)]" value="5" autocomplete="off">
    <input type="hidden" id="user_appointment_time_3i" name="user[appointment_time(3i)]" value="27" autocomplete="off">
    <select id="user_appointment_time_4i" name="user[appointment_time(4i)]" class="form-select">
      ...
      ...
      <option value="18" selected="selected">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
    </select>
    :
    <select id="user_appointment_time_5i" name="user[appointment_time(5i)]" class="form-select">
      <option value="00" selected="selected">00</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      ...
      ...
    </select>
  </div>
</div>
```

### datetime_select

![datetime_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/727558f4-0696-4614-bbe8-3617a5fae3da)

```erb
<%= form.datetime_select :appointment_datetime, {selected: DateTime.now, bootstrap_form: {label_text: "Choose appointment date & time"}}, {} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_appointment_datetime">Choose appointment date &amp; time</label>
  <div class="rails-bootstrap-forms-datetime-select">
    <select id="user_appointment_datetime_1i" name="user[appointment_datetime(1i)]" class="form-select">
      ...
      ...
      <option value="2023" selected="selected">2023</option>
      <option value="2024">2024</option>
      <option value="2025">2025</option>
      <option value="2026">2026</option>
      <option value="2027">2027</option>
      <option value="2028">2028</option>
    </select>
    <select id="user_appointment_datetime_2i" name="user[appointment_datetime(2i)]" class="form-select">
      <option value="1">January</option>
      <option value="2">February</option>
      <option value="3">March</option>
      <option value="4">April</option>
      <option value="5" selected="selected">May</option>
      ...
      ...
    </select>
    <select id="user_appointment_datetime_3i" name="user[appointment_datetime(3i)]" class="form-select">
      ...
      ...
      <option value="27" selected="selected">27</option>
      <option value="28">28</option>
      <option value="29">29</option>
      <option value="30">30</option>
      <option value="31">31</option>
    </select>
    —
    <select id="user_appointment_datetime_4i" name="user[appointment_datetime(4i)]" class="form-select">
      ...
      ...
      <option value="18" selected="selected">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
    </select>
    :
    <select id="user_appointment_datetime_5i" name="user[appointment_datetime(5i)]" class="form-select">
      <option value="00">00</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04" selected="selected">04</option>
      ...
      ...
    </select>
  </div>
</div>
```

### weekday_select

![weekday_select](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/e469a57d-3d22-4c9e-829b-4ba825593ae1)

```erb
<%= form.weekday_select :weekly_off, {selected: "Monday", bootstrap_form: {label_text: "Week off"}}, {} %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_weekly_off">Week off</label>
  <select class="form-select" name="user[weekly_off]" id="user_weekly_off">
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

### check_box

You can use `check_box` form helper to render the check box. This helper will render check box and label for you.

![check_box](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/5836650c-d536-4f4e-b768-75bca9dd7901)

```erb
<%= form.check_box :remember_me %>
```

This generates the following HTML:

```html
<div class="form-check mb-3">
  <input name="user[remember_me]" type="hidden" value="0" autocomplete="off">
  <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me">
  <label class="form-check-label" for="user_remember_me">Keep me signed in</label>
</div>
```

You can set `switch` option to `true` if you want check box to look like switches.

![check_box_switch](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/20c493ce-7f2c-4ac9-a854-e1520cae6a54)

```erb
<%= form.check_box :remember_me, bootstrap_form: {switch: true} %>
```

This generates the following HTML:

```html
<div class="form-check form-switch mb-3">
  <input name="user[remember_me]" type="hidden" value="0" autocomplete="off">
  <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me">
  <label class="form-check-label" for="user_remember_me">Keep me signed in</label>
</div>
```

This helper also renders help text if `help_text` option is set or information of the field is added to the locale file:

![check_box_help_text](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/071a6ac3-112c-42d0-965f-cd7751fdff19)

```erb
<%= form.check_box :terms, required: true %>
```

This generates the following HTML:

```html
<div class="form-check mb-3">
  <input name="user[terms]" type="hidden" value="0" autocomplete="off">
  <input required="required" class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms">
  <label class="form-check-label required" for="user_terms">I accept terms and conditions</label>
  <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
</div>
```

### radio_button

You can use `radio_button` form helper to render the radio button. This helper will render radio button and label for you.

![radio_button](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/9afa4065-6eea-44a6-a5be-d2936d1d2f9c)

```erb
<%= form.radio_button :gender, :male, bootstrap_form: {label_text: "Male"} %>
```

This generates the following HTML:

```html
<div class="form-check mb-3">
  <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male">
  <label class="form-check-label" for="user_gender_male">Male</label>
</div>
```

This helper also renders help text if `help_text` option is set or information of the field is added to the locale file:

![radio_button_help_text](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/2409e822-c1bd-499b-b80f-e2948acf3403)

```erb
<%= form.radio_button :gender, :male, bootstrap_form: {label_text: "Male", help_text: "Please select your gender"} %>
```

This generates the following HTML:

```html
<div class="form-check mb-3">
  <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male">
  <label class="form-check-label" for="user_gender_male">Male</label>
  <div class="form-text text-muted">Please select your gender</div>
</div>
```

### collection_check_boxes

This helper provides a way to create collection of check boxes. This helper accepts same arguments as Rails helper
and takes care of rendering of labels and inputs for you.

![collection_check_boxes](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/2a4b3519-8f7e-4dcb-86d2-5ef5edff10bc)

```erb
<%= form.collection_check_boxes :skill_ids, ::Skill.all, :id, :name %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_skill_ids">Skills</label>
  <div class="rails-bootstrap-forms-collection-check-boxes">
    <input value="" multiple="multiple" autocomplete="off" type="hidden" name="user[skill_ids][]" id="user_skill_ids">
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="1" name="user[skill_ids][]" id="user_skill_ids_1">
      <label class="form-check-label" for="user_skill_ids_1">Communication</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="2" name="user[skill_ids][]" id="user_skill_ids_2">
      <label class="form-check-label" for="user_skill_ids_2">Problem Solving</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="3" name="user[skill_ids][]" id="user_skill_ids_3">
      <label class="form-check-label" for="user_skill_ids_3">Leadership</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="4" name="user[skill_ids][]" id="user_skill_ids_4">
      <label class="form-check-label" for="user_skill_ids_4">Writing</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="5" name="user[skill_ids][]" id="user_skill_ids_5">
      <label class="form-check-label" for="user_skill_ids_5">Creativity</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="6" name="user[skill_ids][]" id="user_skill_ids_6">
      <label class="form-check-label" for="user_skill_ids_6">Time Management</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="7" name="user[skill_ids][]" id="user_skill_ids_7">
      <label class="form-check-label" for="user_skill_ids_7">Team Work</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="8" name="user[skill_ids][]" id="user_skill_ids_8">
      <label class="form-check-label" for="user_skill_ids_8">Negotiation</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="9" name="user[skill_ids][]" id="user_skill_ids_9">
      <label class="form-check-label" for="user_skill_ids_9">Decision Making</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" value="10" name="user[skill_ids][]" id="user_skill_ids_10">
      <label class="form-check-label" for="user_skill_ids_10">Management</label>
    </div>
  </div>
  <div class="form-text text-muted">Select your strong skills</div>
</div>
```

### collection_radio_buttons

This helper provides a way to create collection of check boxes. This helper accepts same arguments as Rails helper
and takes care of rendering of labels and inputs for you.

![collection_radio_buttons](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/178a6990-53fe-4276-b511-b12f8fd9d90f)

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

### text_field

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

### color_field

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

![date_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/fc2f6fc5-92c2-4596-929f-33388e4cd2a4)

```erb
<%= form.date_field :appointment_date %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label required" for="user_appointment_date">Appointment date</label>
  <input class="form-control" aria-required="true" required="required" type="date" name="user[appointment_date]" id="user_appointment_date">
</div>
```

### datetime_field

![datetime_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/ce304f4c-85d9-46be-b130-d2a755f9b018)

```erb
<%= form.datetime_field :appointment_datetime %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_appointment_datetime">Appointment datetime</label>
  <input class="form-control" type="datetime-local" name="user[appointment_datetime]" id="user_appointment_datetime">
</div>
```

### datetime_local_field

![datetime_local_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/75ee5833-9278-48bd-aac9-faed940b3045)

```erb
<%= form.datetime_local_field :appointment_datetime %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_appointment_datetime">Appointment datetime</label>
  <input class="form-control" type="datetime-local" name="user[appointment_datetime]" id="user_appointment_datetime">
</div>
```

### email_field

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

### file_field

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

### month_field

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

![number_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/2d41823a-8b0c-4712-ba80-274725ac497a)

```erb
<%= form.number_field :age %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_age">Age</label>
  <input class="form-control" type="number" name="user[age]" id="user_age">
</div>
```

### password_field

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

### range_field

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

### search_field

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

### time_field

![time_field](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/90ce4c18-d50c-4b8d-aef6-bc1971a38c99)

```erb
<%= form.time_field :appointment_time %>
```

This generates the following HTML:

```html
<div class="mb-3">
  <label class="form-label" for="user_appointment_time">Appointment time</label>
  <input class="form-control" type="time" name="user[appointment_time]" id="user_appointment_time">
</div>
```

### url_field

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
