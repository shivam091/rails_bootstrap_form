# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/bootstrap_form_layout_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::BootstrapFormBuilder do
  it "checks markup of vertical form" do
    expected = <<~HTML
      <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email" />
          <div class="form-text text-muted">Please use official email address</div>
        </div>
        <div class="mb-3">
          <label class="form-label required" for="user_password">Password</label>
          <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password" />
        </div>
        <div class="mb-3">
          <label class="form-label required" for="user_birth_date">Birth date</label>
          <input class="form-control" aria-required="true" required="required" type="date" name="user[birth_date]" id="user_birth_date" />
        </div>
        <div class="mb-3">
          <label class="form-label" for="user_excellence">Excellence</label>
          <input class="form-range" type="range" name="user[excellence]" id="user_excellence" />
        </div>
        <div class="mb-3">
          <label class="form-label required" for="user_favorite_color">Favorite color</label>
          <input class="form-control form-control-color" aria-required="true" required="required" value="#000000" type="color" name="user[favorite_color]" id="user_favorite_color" />
        </div>
        <div class="form-check mb-3">
          <input name="user[terms]" type="hidden" value="0" autocomplete="off" />
          <input class="form-check-input" type="checkbox" value="1" name="user[terms]" id="user_terms" />
          <label class="form-check-label" for="user_terms">I accept terms and conditions</label>
          <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
        </div>
      </form>
    HTML

    actual = bootstrap_form_with(model: @user, url: "/test") do |form|
      concat(form.text_field(:name))
      concat(form.email_field(:email))
      concat(form.password_field(:password))
      concat(form.date_field(:birth_date))
      concat(form.range_field(:excellence))
      concat(form.color_field(:favorite_color))
      concat(form.check_box(:terms))
    end

    expect(actual).to match_html(expected)
  end

  it "checks markup of horizontal form" do
    expected = <<~HTML
      <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_name">Name</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
          </div>
        </div>
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_email">Email address</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="email" name="user[email]" id="user_email" />
            <div class="form-text text-muted">Please use official email address</div>
          </div>
        </div>
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_password">Password</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password" />
          </div>
        </div>
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_birth_date">Birth date</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="date" name="user[birth_date]" id="user_birth_date" />
          </div>
        </div>
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_excellence">Excellence</label>
          <div class="col-sm-10">
            <input class="form-range" type="range" name="user[excellence]" id="user_excellence" />
          </div>
        </div>
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_favorite_color">Favorite color</label>
          <div class="col-sm-10">
            <input class="form-control form-control-color" aria-required="true" required="required" value="#000000" type="color" name="user[favorite_color]" id="user_favorite_color" />
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-sm-10 offset-sm-2">
            <div class="form-check">
              <input name="user[term]" type="hidden" value="0" autocomplete="off" />
              <input class="form-check-input" type="checkbox" value="1" name="user[term]" id="user_term" />
              <label class="form-check-label" for="user_term">Term</label>
            </div>
          </div>
        </div>
      </form>
    HTML

    actual = bootstrap_form_with(model: @user, url: "/test", bootstrap_form: {layout: :horizontal}) do |form|
      concat(form.text_field(:name))
      concat(form.email_field(:email))
      concat(form.password_field(:password))
      concat(form.date_field(:birth_date))
      concat(form.range_field(:excellence))
      concat(form.color_field(:favorite_color))
      concat(form.check_box(:term))
    end

    expect(actual).to match_html(expected)
  end
end
