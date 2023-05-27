# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/helpers/help_text_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Helpers::HelpText do
  describe "#help_text" do
    it "sets help text from locale file" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
          <div class="form-text text-muted">Please use official email address</div>
        </div>
      HTML

      actual = @vertical_builder.text_field :email

      expect(actual).to match_html(expected)
    end

    it "sets custom help text" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
          <div class="form-text text-muted">Please provide your full name.</div>
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {help_text: "Please provide your full name."}

      expect(actual).to match_html(expected)
    end

    it "does not display help text" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_email">Email address</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[email]" id="user_email" />
        </div>
      HTML

      actual = @vertical_builder.text_field :email, bootstrap_form: {help_text: false}

      expect(actual).to match_html(expected)
    end
  end
end
