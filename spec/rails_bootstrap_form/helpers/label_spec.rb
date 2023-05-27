# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/helpers/label_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Helpers::Labels do
  describe "#draw_label" do
    it "takes label text from locale file" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = @vertical_builder.text_field :name

      expect(actual).to match_html(expected)
    end

    it "sets label text based on value of label_text option" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Full name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {label_text: "Full name"}

      expect(actual).to match_html(expected)
    end

    it "hides a label" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label visually-hidden required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {hide_label: true}

      expect(actual).to match_html(expected)
    end

    it "skips a label" do
      expected = <<~HTML
        <div class="mb-3">
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {skip_label: true}

      expect(actual).to match_html(expected)
    end

    it "adds additional CSS class to a label" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label custom-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {additional_label_class: "custom-label"}

      expect(actual).to match_html(expected)
    end

    it "sets label for a field in horizontal form" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_name">Name</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
          </div>
        </div>
      HTML

      actual = @horizontal_builder.text_field :name

      expect(actual).to match_html(expected)
    end
  end
end
