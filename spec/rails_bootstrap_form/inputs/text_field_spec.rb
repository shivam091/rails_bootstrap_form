# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/text_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::TextField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#text_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="text" name="user[name]" id="user_name" />
      HTML

      actual = form_builder.text_field :name, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" placeholder="Name" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_name">Name</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
          </div>
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "can have a floating label in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-floating">
            <input class="form-control" aria-required="true" required="required" placeholder="Name" type="text" name="user[name]" id="user_name" />
            <label class="form-label required" for="user_name">Name</label>
          </div>
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {floating: true}

      expect(actual).to match_html(expected)
    end

    it "cannot have a floating label in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_name">Name</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
          </div>
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {floating: true, layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "skips label" do
      expected = <<~HTML
        <div class="mb-3">
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {skip_label: true}

      expect(actual).to match_html(expected)
    end

    it "hides label" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label visually-hidden required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {hide_label: true}

      expect(actual).to match_html(expected)
    end

    it "adds additional css class" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control custom-class" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, class: "custom-class"

      expect(actual).to match_html(expected)
    end

    it "additional_field_class takes precedance over HTML class" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control custom-text-field" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {additional_field_class: "custom-text-field"}, class: "html-class"

      expect(actual).to match_html(expected)
    end

    it "adds additional css class to a label" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label custom-class required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {additional_label_class: "custom-class"}

      expect(actual).to match_html(expected)
    end

    it "changes css class" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="custom-form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {field_class: "custom-form-control"}

      expect(actual).to match_html(expected)
    end

    it "changes css class of the label" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="custom-form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {label_class: "custom-form-label"}

      expect(actual).to match_html(expected)
    end

    it "sets user specified help text" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
          <div class="form-text text-muted">Please provide your full name</div>
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {help_text: "Please provide your full name"}

      expect(actual).to match_html(expected)
    end

    it "sets help text from locale file" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
          <div class="form-text text-muted">Please use official email address</div>
        </div>
      HTML

      actual = form_builder.text_field :email

      expect(actual).to match_html(expected)
    end

    it "customizes label text" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Full name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {label_text: "Full name"}

      expect(actual).to match_html(expected)
    end

    it "does not render in a wrapper" do
      expected = <<~HTML
        <label class="form-label required" for="user_name">Name</label>
        <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
      HTML

      actual = form_builder.text_field :name, bootstrap: {wrapper: false}

      expect(actual).to match_html(expected)
    end

    it "adds additional wrapper options" do
      expected = <<~HTML
        <div class="mb-3" data-controller="hello">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {wrapper: {data: {controller: "hello"}}}

      expect(actual).to match_html(expected)
    end

    it "appends wrapper[:class] to existing wrapper classes" do
      expected = <<~HTML
        <div class="mb-3 custom-class">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {wrapper: {class: "custom-class", }}

      expect(actual).to match_html(expected)
    end

    it "supports input group" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <div class="input-group">
            <span class="input-group-text"><strong>$</strong></span>
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <span class="input-group-text">0.0</span>
          </div>
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {prepend: "<strong>$</strong>", append: "0.0"}

      expect(actual).to match_html(expected)
    end

    it "supports button in input group" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <div class="input-group">
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <button name="button" type="submit" class="btn btn-secondary">Go</button>
          </div>
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {append: (button_tag("Go", type: :submit, class: "btn btn-secondary"))}

      expect(actual).to match_html(expected)
    end

    it "supports multiple addons in input group" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <div class="input-group">
            <span class="input-group-text">$</span>
            <span class="input-group-text">Rs</span>
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <span class="input-group-text">0.0</span>
          </div>
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {prepend: ["$", "Rs"], append: "0.0"}

      expect(actual).to match_html(expected)
    end

    it "supports input group with floating labels" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="input-group">
            <span class="input-group-text">$</span>
            <div class="form-floating">
              <input class="form-control" aria-required="true" required="required" placeholder="Name" type="text" name="user[name]" id="user_name" />
              <label class="form-label required" for="user_name">Name</label>
            </div>
            <span class="input-group-text">0.0</span>
          </div>
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {prepend: "$", append: "0.0", floating: true}

      expect(actual).to match_html(expected)
    end

    it "changes size" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control form-control-sm" aria-required="true" required="required" type="text" name="user[name]" id="user_name">
        </div>
      HTML

      actual = form_builder.text_field :name, bootstrap: {size: :sm}

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in vertical layout" do
      user.errors.add(:name, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <label class="form-label required is-invalid" for="user_name">Name</label>
            <input class="form-control is-invalid" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <div class="invalid-feedback">can't be blank</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test") do |form|
        concat(form.text_field(:name))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in inline layout" do
      user.errors.add(:name, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" class="row row-cols-lg-auto g-3 align-items-center" action="/test" accept-charset="UTF-8" method="post">
          <div class="col-12">
            <label class="form-label visually-hidden required is-invalid" for="user_name">Name</label>
            <input class="form-control is-invalid" aria-required="true" required="required" placeholder="Name" type="text" name="user[name]" id="user_name" />
            <div class="invalid-feedback">can't be blank</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :inline}) do |form|
        concat(form.text_field(:name))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in horizontal layout" do
      user.errors.add(:name, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="row mb-3">
            <label class="col-form-label col-sm-2 required is-invalid" for="user_name">Name</label>
            <div class="col-sm-10">
              <input class="form-control is-invalid" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
              <div class="invalid-feedback">can't be blank</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :horizontal}) do |form|
        concat(form.text_field(:name))
      end

      expect(actual).to match_html(expected)
    end
  end
end
