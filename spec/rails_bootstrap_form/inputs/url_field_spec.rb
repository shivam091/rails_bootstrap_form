# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/url_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::UrlField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#url_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="url" name="user[blog_url]" id="user_blog_url" />
      HTML

      actual = form_builder.url_field :blog_url, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_blog_url">Blog URL</label>
          <input class="form-control" type="url" name="user[blog_url]" id="user_blog_url" />
        </div>
      HTML

      actual = form_builder.url_field :blog_url

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_blog_url">Blog URL</label>
          <input class="form-control" placeholder="Blog URL" type="url" name="user[blog_url]" id="user_blog_url" />
        </div>
      HTML

      actual = form_builder.url_field :blog_url, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_blog_url">Blog URL</label>
          <div class="col-sm-10">
            <input class="form-control" type="url" name="user[blog_url]" id="user_blog_url" />
          </div>
        </div>
      HTML

      actual = form_builder.url_field :blog_url, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
