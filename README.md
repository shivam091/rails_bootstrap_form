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

## Bootstrap configuration options

Here's a list of all possible options you can pass via `bootstrap_form` option that can be attached to the `bootstrap_form_for` or `bootstrap_form_with` or any field helpers inside of it:

| Option | Description | Default value |
| ------ | ------------- | ----------- |
| `layout` | Controls form and field layout. It can be `vertical` `horizontal`, or `inline`. | vertical |
| `field_class` | A CSS class that will be applied to all form fields and it can be overridden by the `BootstrapFormOptions` object. | form-control |
| `additional_field_class` | An additional CSS class that will be added along with the existing `field_class` of the field. | nil |
| `help_text` | Describes help text for the HTML field. Help text is automatically read from translation file. If you want to customize it, you can pass a string. You can also set it `false` if you do not want help text displayed. | nil |
| `label_text` | An option to override automatically generated label text. | nil |
| `skip_label` | An option to custmize whether the label is to be displayed or not. | false |
| `hide_label` | An option to customize whether the label is only visible to screen readers. | false |
| `hide_class` | The CSS class that will be used when the label is only accessible by screen readers. | visually-hidden |
| `label_class` | A CSS class that will be applied to all label tags when layout is vertical. | form-label |
| `additional_label_class` | An additional CSS class that will be added along with the existing `label_class` of the label. | nil |
| `prepend` | Raw or HTML content to be prepended to the field. | nil |
| `append` | Raw or HTML content to be appended to the field. | nil |
| `additional_input_group_class` | Append additional CSS class added to the input group wrapper. | nil |
| `floating` | An option to control whether the field should have a floating label. | false |
| `static_field_class` | A CSS class that will be applied to all static fields. | form-control-plaintext |
| `switch` | An option to control whether the check box should look like bootstrap switches. | false |
| `wrapper_options` | An option to controls the HTML attributes and options that will be added to the field wrapper. | {} |
| `size` | An option to specify the size of input groups, buttons, labels, and fields. | nil |
| `inline` | An option to render checkboxes and radio buttons inline. | false |
| `label_col_class` | A CSS class that will be applied to all label tags when layout is `horizontal`. | col-form-label |
| `label_col_wrapper_class` | A CSS class for label column when using `horizontal` form. | col-sm-2 |
| `field_col_wrapper_class` | A CSS class for control column when using `horizontal` form. | col-sm-10 |
| `render_as_button` | An option to render submit button using `<button type="submit">` instead of `<input type="submit">`. | false |

## Usage

### bootstrap_form_for

To get started, use the `bootstrap_form_for` helper in place of the Rails `form_for` helper. Here's an example:

![Example 1](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/9a7bbbe9-0ee8-4777-9f2c-2b1425f0184c)

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

![Example 2](https://github.com/shivam091/rails_bootstrap_form/assets/7858927/621421b1-4cd3-4dd0-b2dd-89c5893917dc)

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
