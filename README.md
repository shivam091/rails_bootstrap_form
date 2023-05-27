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
