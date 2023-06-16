# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/static_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::StaticField do
  let(:user) { ::User.new(email: "steve@example.com") }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#static_field" do
    it "renders static field correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input readonly="readonly" disabled="disabled" value="steve@example.com" class="form-control-plaintext" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
        </div>
      HTML

      actual = form_builder.static_field :email, bootstrap: {help_text: false}

      expect(actual).to match_html(expected)
    end

    it "renders static field correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_email">Email address</label>
          <input readonly="readonly" disabled="disabled" value="steve@example.com" class="form-control-plaintext" aria-required="true" required="required" placeholder="Email address" type="text" name="user[email]" id="user_email" />
        </div>
      HTML

      actual = form_builder.static_field :email, bootstrap: {help_text: false, layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders static field correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_email">Email address</label>
          <div class="col-sm-10">
            <input readonly="readonly" disabled="disabled" value="steve@example.com" class="form-control-plaintext" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
          </div>
        </div>
      HTML

      actual = form_builder.static_field :email, bootstrap: {help_text: false, layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "sets value from HTML option" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input readonly="readonly" disabled="disabled" value="abc" class="form-control-plaintext" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
        </div>
      HTML

      actual = form_builder.static_field :email, value: "abc", bootstrap: {help_text: false}

      expect(actual).to match_html(expected)
    end
  end
end
