# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/range_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::RangeField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#range_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="range" name="user[excellence]" id="user_excellence" />
      HTML

      actual = form_builder.range_field :excellence, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_excellence">Excellence</label>
          <input class="form-range" type="range" name="user[excellence]" id="user_excellence" />
        </div>
      HTML

      actual = form_builder.range_field :excellence

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_excellence">Excellence</label>
          <input class="form-range" placeholder="Excellence" type="range" name="user[excellence]" id="user_excellence" />
        </div>
      HTML

      actual = form_builder.range_field :excellence, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_excellence">Excellence</label>
          <div class="col-sm-10">
            <input class="form-range" type="range" name="user[excellence]" id="user_excellence" />
          </div>
        </div>
      HTML

      actual = form_builder.range_field :excellence, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
