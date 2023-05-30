# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/input_group_wrapper_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::InputGroupBuilder do
  describe "#input_group_wrapper" do
    it "prepends and appends single addon to the field" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_expected_ctc">Expected CTC</label>
          <div class="input-group">
            <span class="input-group-text">₹</span>
            <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc" />
            <span class="input-group-text">.00</span>
          </div>
        </div>
      HTML

      actual = @vertical_builder.number_field :expected_ctc, bootstrap: {prepend: "₹", append: ".00"}

      expect(actual).to match_html(expected)
    end

    it "prepends and appends multiple addons to the field" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_expected_ctc">Expected CTC</label>
          <div class="input-group">
            <span class="input-group-text">Net</span>
            <span class="input-group-text">₹</span>
            <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc" />
            <span class="input-group-text">.00</span>
            <span class="input-group-text">per day</span>
          </div>
        </div>
      HTML

      actual = @vertical_builder.number_field :expected_ctc, bootstrap: {prepend: ["Net", "₹"], append: [".00", "per day"]}

      expect(actual).to match_html(expected)
    end

    it "appends button to the field" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_expected_ctc">Expected CTC</label>
          <div class="input-group">
            <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc" />
            <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search" />
          </div>
        </div>
      HTML

      actual = @vertical_builder.number_field :expected_ctc, bootstrap: {append: @vertical_builder.secondary("Search")}

      expect(actual).to match_html(expected)
    end

    it "adds additional CSS class to a input group" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_expected_ctc">Expected CTC</label>
          <div class="input-group custom-class">
            <span class="input-group-text">₹</span>
            <input class="form-control" type="number" name="user[expected_ctc]" id="user_expected_ctc" />
            <span class="input-group-text">.00</span>
          </div>
        </div>
      HTML

      actual = @vertical_builder.number_field :expected_ctc, bootstrap: {prepend: "₹", append: ".00", additional_input_group_class: "custom-class"}

      expect(actual).to match_html(expected)
    end

    it "render a input group in small size" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_expected_ctc">Expected CTC</label>
          <div class="input-group input-group-sm">
            <span class="input-group-text">₹</span>
            <input class="form-control form-control-sm" type="number" name="user[expected_ctc]" id="user_expected_ctc" />
            <span class="input-group-text">.00</span>
          </div>
        </div>
      HTML

      actual = @vertical_builder.number_field :expected_ctc, bootstrap: {prepend: "₹", append: ".00", size: :sm}

      expect(actual).to match_html(expected)
    end
  end
end
