# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/email_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::EmailField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#email_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="email" name="user[email]" id="user_email" />
      HTML

      actual = form_builder.email_field :email, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email" />
          <div class="form-text text-muted">Please use official email address</div>
        </div>
      HTML

      actual = form_builder.email_field :email

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_email">Email address</label>
          <input class="form-control" aria-required="true" required="required" placeholder="Email address" type="email" name="user[email]" id="user_email" />
          <div class="form-text text-muted">Please use official email address</div>
        </div>
      HTML

      actual = form_builder.email_field :email, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_email">Email address</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email" />
            <div class="form-text text-muted">Please use official email address</div>
          </div>
        </div>
      HTML

      actual = form_builder.email_field :email, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in vertical layout" do
      user.errors.add(:email, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <label class="form-label required is-invalid" for="user_email">Email address</label>
            <input class="form-control is-invalid" aria-required="true" required="required" type="email" name="user[email]" id="user_email" />
            <div class="invalid-feedback">can't be blank</div>
            <div class="form-text text-muted">Please use official email address</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test") do |form|
        concat(form.email_field(:email))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in horizontal layout" do
      user.errors.add(:email, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="row mb-3">
            <label class="col-form-label col-sm-2 required is-invalid" for="user_email">Email address</label>
            <div class="col-sm-10">
              <input class="form-control is-invalid" aria-required="true" required="required" type="email" name="user[email]" id="user_email" />
              <div class="invalid-feedback">can't be blank</div>
              <div class="form-text text-muted">Please use official email address</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :horizontal}) do |form|
        concat(form.email_field(:email))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in inline layout" do
      user.errors.add(:email, :blank)

      expected = <<~HTML
        <form novalidate="novalidate" class="row row-cols-lg-auto g-3 align-items-center" action="/test" accept-charset="UTF-8" method="post">
          <div class="col-12">
            <label class="form-label visually-hidden required is-invalid" for="user_email">Email address</label>
            <input class="form-control is-invalid" aria-required="true" required="required" placeholder="Email address" type="email" name="user[email]" id="user_email" />
            <div class="invalid-feedback">can't be blank</div>
            <div class="form-text text-muted">Please use official email address</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :inline}) do |form|
        concat(form.email_field(:email))
      end

      expect(actual).to match_html(expected)
    end
  end
end
