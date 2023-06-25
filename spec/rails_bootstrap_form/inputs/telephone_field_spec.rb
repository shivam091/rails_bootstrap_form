# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/telephone_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::TelephoneField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#telephone_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="tel" name="user[mobile_number]" id="user_mobile_number" />
      HTML

      actual = form_builder.telephone_field :mobile_number, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_mobile_number">Mobile number</label>
          <input class="form-control" aria-required="true" required="required" type="tel" name="user[mobile_number]" id="user_mobile_number" />
        </div>
      HTML

      actual = form_builder.telephone_field :mobile_number

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_mobile_number">Mobile number</label>
          <input class="form-control" aria-required="true" required="required" placeholder="Mobile number" type="tel" name="user[mobile_number]" id="user_mobile_number" />
        </div>
      HTML

      actual = form_builder.telephone_field :mobile_number, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_mobile_number">Mobile number</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="tel" name="user[mobile_number]" id="user_mobile_number" />
          </div>
        </div>
      HTML

      actual = form_builder.telephone_field :mobile_number, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
