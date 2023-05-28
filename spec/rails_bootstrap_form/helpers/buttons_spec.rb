# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/helpers/buttons_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Helpers::Buttons do
  describe "#render_button" do
    it "renders submit button correctly in vertical layout" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
      HTML

      actual = @vertical_builder.secondary "Search"

      expect(actual).to match_html(expected)
    end

    it "renders submit button correctly in horizontal layout" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
      HTML

      actual = @horizontal_builder.secondary "Search"

      expect(actual).to match_html(expected)
    end

    it "renders submit button correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
        </div>
      HTML

      actual = @inline_builder.secondary "Search"

      expect(actual).to match_html(expected)
    end

    it "renders submit button as button helper when render_as_button is true" do
      expected = <<~HTML
        <button name="button" type="submit" class="btn btn-primary">Register</button>
      HTML

      actual = @vertical_builder.primary "Register", bootstrap_form: {render_as_button: true}

      expect(actual).to match_html(expected)
    end

    it "renders submit button as button helper when block is passed" do
      expected = <<~HTML
        <button name="button" type="submit" class="btn btn-danger">Delete</button>
      HTML

      actual = @vertical_builder.danger do
        "Delete"
      end

      expect(actual).to match_html(expected)
    end

    it "adds additional class to the submit button" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Delete" class="custom-button btn btn-danger" data-disable-with="Delete">
      HTML

      actual = @vertical_builder.danger "Delete", class: "custom-button"

      expect(actual).to match_html(expected)
    end
  end
end
