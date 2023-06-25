# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/password_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::PasswordField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#password_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="password" name="user[password]" id="user_password" />
      HTML

      actual = form_builder.password_field :password, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_password">Password</label>
          <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password" />
        </div>
      HTML

      actual = form_builder.password_field :password

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_password">Password</label>
          <input class="form-control" aria-required="true" required="required" placeholder="Password" type="password" name="user[password]" id="user_password" />
        </div>
      HTML

      actual = form_builder.password_field :password, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_password">Password</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="password" name="user[password]" id="user_password" />
          </div>
        </div>
      HTML

      actual = form_builder.password_field :password, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
