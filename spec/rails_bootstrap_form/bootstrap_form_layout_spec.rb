# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/bootstrap_form_layout_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::BootstrapFormBuilder do
  let(:user) { User.new }

  it "checks markup of vertical form" do
    expected = <<~HTML
      <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
        <div class="mb-3">
          <label class="form-label" for="user_username">Username</label>
          <input class="form-control" type="text" name="user[username]" id="user_username" />
        </div>
        <div class="mb-3">
          <label class="form-label required" for="user_password">Password</label>
          <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password" />
        </div>
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me" />
            <label class="form-check-label" for="user_remember_me">Keep me signed in</label>
          </div>
        </div>
        <input type="submit" name="commit" value="Login" class="btn btn-primary" data-disable-with="Login" />
      </form>
    HTML

    actual = bootstrap_form_with(model: user, url: "/test") do |form|
      concat(form.text_field(:username))
      concat(form.password_field(:password))
      concat(form.check_box(:remember_me))
      concat(form.primary("Login"))
    end

    expect(actual).to match_html(expected)
  end

  it "checks markup of horizontal form" do
    expected = <<~HTML
      <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_username">Username</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="user[username]" id="user_username" />
          </div>
        </div>
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_password">Password</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password" />
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-sm-10 offset-sm-2">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me" />
              <label class="form-check-label" for="user_remember_me">Keep me signed in</label>
            </div>
          </div>
        </div>
        <input type="submit" name="commit" value="Login" class="btn btn-primary" data-disable-with="Login" />
      </form>
    HTML

    actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :horizontal}) do |form|
      concat(form.text_field(:username))
      concat(form.password_field(:password))
      concat(form.check_box(:remember_me))
      concat(form.primary("Login"))
    end

    expect(actual).to match_html(expected)
  end

  it "checks markup of inline form" do
    expected = <<~HTML
      <form role="form" novalidate="novalidate" class="row row-cols-lg-auto g-3 align-items-center" action="/test" accept-charset="UTF-8" method="post">
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_username">Username</label>
          <input class="form-control" placeholder="Username" type="text" name="user[username]" id="user_username" />
        </div>
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_password">Password</label>
          <input class="form-control" aria-required="true" required="required" placeholder="Password" type="password" name="user[password]" id="user_password" />
        </div>
        <div class="col-12">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me" />
            <label class="form-check-label" for="user_remember_me">Keep me signed in</label>
          </div>
        </div>
        <div class="col-12">
          <input type="submit" name="commit" value="Login" class="btn btn-primary" data-disable-with="Login" />
        </div>
      </form>
    HTML

    actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :inline}) do |form|
      concat(form.text_field(:username))
      concat(form.password_field(:password))
      concat(form.check_box(:remember_me))
      concat(form.primary("Login"))
    end

    expect(actual).to match_html(expected)
  end
end
