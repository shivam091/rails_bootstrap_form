# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/search_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::SearchField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#search_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="search" name="user[name]" id="user_name" />
      HTML

      actual = form_builder.search_field :name, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="search" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.search_field :name

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" placeholder="Name" type="search" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.search_field :name, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_name">Name</label>
          <div class="col-sm-10">
            <input class="form-control" aria-required="true" required="required" type="search" name="user[name]" id="user_name" />
          </div>
        </div>
      HTML

      actual = form_builder.search_field :name, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "adds data-attributes (or any other options) to wrapper" do
      expected = <<~HTML
        <div class="mb-3" data-controller="test-controller">
          <label class="form-label required" for="user_name">Name</label>
          <input class="form-control" aria-required="true" required="required" type="search" name="user[name]" id="user_name" />
        </div>
      HTML

      actual = form_builder.search_field :name, bootstrap: {wrapper: {data: {controller: "test-controller"}}}

      expect(actual).to match_html(expected)
    end
  end
end
