# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/number_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::NumberField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#number_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="number" name="user[expected_ctc]" id="user_expected_ctc" />
      HTML

      actual = form_builder.number_field :expected_ctc, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_expected_ctc">Expected CTC</label>
          <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc" />
        </div>
      HTML

      actual = form_builder.number_field :expected_ctc

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_expected_ctc">Expected CTC</label>
          <input class="form-control" placeholder="Expected CTC" type="number" name="user[expected_ctc]" id="user_expected_ctc" />
        </div>
      HTML

      actual = form_builder.number_field :expected_ctc, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_expected_ctc">Expected CTC</label>
          <div class="col-sm-10">
            <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc" />
          </div>
        </div>
      HTML

      actual = form_builder.number_field :expected_ctc, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
