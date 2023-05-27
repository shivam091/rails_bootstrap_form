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
          <label class="form-label required" for="user_name">Name</label>
          <div class="input-group">
            <span class="input-group-text">₹</span>
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <span class="input-group-text">.00</span>
          </div>
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {prepend: "₹", append: ".00"}

      expect(actual).to match_html(expected)
    end

    it "prepends and appends multiple addons to the field" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <div class="input-group">
            <span class="input-group-text">Net</span>
            <span class="input-group-text">₹</span>
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <span class="input-group-text">.00</span>
            <span class="input-group-text">per day</span>
          </div>
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {prepend: ["Net", "₹"], append: [".00", "per day"]}

      expect(actual).to match_html(expected)
    end

    it "appends button to the field" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <div class="input-group">
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search" />
          </div>
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {append: @vertical_builder.secondary("Search")}

      expect(actual).to match_html(expected)
    end

    it "adds additional CSS class to a input group" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <div class="input-group custom-class">
            <span class="input-group-text">₹</span>
            <input class="form-control" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <span class="input-group-text">.00</span>
          </div>
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {prepend: "₹", append: ".00", additional_input_group_class: "custom-class"}

      expect(actual).to match_html(expected)
    end

    it "render a input group in small size" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <div class="input-group input-group-sm">
            <span class="input-group-text">₹</span>
            <input class="form-control form-control-sm" aria-required="true" required="required" type="text" name="user[name]" id="user_name" />
            <span class="input-group-text">.00</span>
          </div>
        </div>
      HTML

      actual = @vertical_builder.text_field :name, bootstrap_form: {prepend: "₹", append: ".00", size: :sm}

      expect(actual).to match_html(expected)
    end
  end
end
