# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/helpers/buttons_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Helpers::Buttons do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#render_button" do
    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
      HTML

      actual = form_builder.secondary "Search"

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
      HTML

      actual = form_builder.secondary "Search", bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
        </div>
      HTML

      actual = form_builder.secondary "Search", bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders as button helper when render_as_button is true" do
      expected = <<~HTML
        <button name="button" type="submit" class="btn btn-primary">Register</button>
      HTML

      actual = form_builder.primary "Register", bootstrap: {render_as_button: true}

      expect(actual).to match_html(expected)
    end

    it "renders as button helper when block is passed" do
      expected = <<~HTML
        <button name="button" type="submit" class="btn btn-danger">Delete</button>
      HTML

      actual = form_builder.danger do
        "Delete"
      end

      expect(actual).to match_html(expected)
    end

    it "renders as button helper when block is passed along with aditional options" do
      expected = <<~HTML
        <button name="button" type="submit" data-controller="test" class="btn btn-danger">Delete</button>
      HTML

      actual = form_builder.danger data: {controller: "test"} do
        "Delete"
      end

      expect(actual).to match_html(expected)
    end

    it "adds additional class" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Delete" class="custom-button btn btn-danger" data-disable-with="Delete">
      HTML

      actual = form_builder.danger "Delete", class: "custom-button"

      expect(actual).to match_html(expected)
    end

    it "renders secondary button" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Search" class="btn btn-secondary" data-disable-with="Search">
      HTML

      actual = form_builder.secondary "Search"

      expect(actual).to match_html(expected)
    end

    it "renders primary button" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Register" class="btn btn-primary" data-disable-with="Register">
      HTML

      actual = form_builder.primary "Register"

      expect(actual).to match_html(expected)
    end

    it "renders danger button" do
      expected = <<~HTML
        <input type="submit" name="commit" value="Delete" class="btn btn-danger" data-disable-with="Delete">
      HTML

      actual = form_builder.danger "Delete"

      expect(actual).to match_html(expected)
    end
  end

  describe "#button_variant_class" do
    let(:dummy_class) { Class.new { include RailsBootstrapForm::Helpers::Buttons } }
    subject { dummy_class.new }

    it "does add secondary variant class" do
      expect(subject.send(:button_variant_class, {variant: "secondary"})).to eq("btn-secondary")
    end

    it "does add primary variant class" do
      expect(subject.send(:button_variant_class, {variant: "primary"})).to eq("btn-primary")
    end

    it "does add danger variant class" do
      expect(subject.send(:button_variant_class, {variant: "danger"})).to eq("btn-danger")
    end

    it "does not add any variant class" do
      expect(subject.send(:button_variant_class, {variant: "invalid"})).to eq("")
    end
  end
end
