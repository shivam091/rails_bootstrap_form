# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/static_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::StaticField do
  before { @user.email = "steve@example.com" }

  describe "#static_field" do
    it "wraps static field correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input readonly="readonly" disabled="disabled" value="steve@example.com" class="form-control-plaintext" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
        </div>
      HTML

      actual = @vertical_builder.static_field :email, bootstrap: {help_text: false}

      expect(actual).to match_html(expected)
    end

    it "wraps static field correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_email">Email address</label>
          <input readonly="readonly" disabled="disabled" value="steve@example.com" class="form-control-plaintext" aria-required="true" required="required" placeholder="Email address" type="text" name="user[email]" id="user_email" />
        </div>
      HTML

      actual = @inline_builder.static_field :email, bootstrap: {help_text: false}

      expect(actual).to match_html(expected)
    end

    it "wraps static field correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_email">Email address</label>
          <div class="col-sm-10">
            <input readonly="readonly" disabled="disabled" value="steve@example.com" class="form-control-plaintext" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
          </div>
        </div>
      HTML

      actual = @horizontal_builder.static_field :email, bootstrap: {help_text: false}

      expect(actual).to match_html(expected)
    end

    it "sets other value" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input readonly="readonly" disabled="disabled" value="abc" class="form-control-plaintext" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
        </div>
      HTML

      actual = @vertical_builder.static_field :email, value: "abc", bootstrap: {help_text: false}

      expect(actual).to match_html(expected)
    end
  end
end
