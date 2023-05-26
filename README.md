# RailsBootstrapForm

**rails_bootstrap_form** is a Rails form builder that makes it super easy to integrate
[Bootstrap 5](https://getbootstrap.com/) forms into your Rails application.

## Minimum Requirements

* Ruby 3.2.2+ (https://www.ruby-lang.org/en/downloads/branches/)
* Rails 7.0+ (https://guides.rubyonrails.org/maintenance_policy.html)
* Bootstrap 5.0+ (https://getbootstrap.com/docs/versions/)

## Installation

Install Bootstrap 5. There are many ways to do this, depending on the asset pipeline you're using in your Rails application. One way is to use the gem that works with Sprockets. To do so, in a brand new Rails 7.0 application created _without_ the `--webpacker` option, add the `bootstrap` gem to your `Gemfile`:

```ruby
gem "bootstrap", "~> 5.0"
```

And follow the remaining instructions in the [official bootstrap installation guide](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails) for setting up `application.scss` and `application.js`.

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

If you followed the [official bootstrap installation guide](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails), you'll probably have switched to SCSS. In this case add the following line to your `application.scss`:

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
