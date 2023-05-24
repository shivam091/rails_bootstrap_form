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
gem "rails_bootstrap_form", "~> 0.6.1"
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
