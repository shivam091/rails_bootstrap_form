# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/hidden_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::HiddenField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#hidden_field" do
    it "renders correctly" do
      expected = <<~HTML
        <input #{autocomplete_attr} type="hidden" name="user[name]" id="user_name" />
      HTML

      actual = form_builder.hidden_field :name

      expect(actual).to match_html(expected)
    end
  end
end
