# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/file_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::FileField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#file_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="file" name="user[avatar]" id="user_avatar" />
      HTML

      actual = form_builder.file_field :avatar, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label" for="user_avatar">Avatar</label>
          <input class="form-control" type="file" name="user[avatar]" id="user_avatar" />
        </div>
      HTML

      actual = form_builder.file_field :avatar

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden" for="user_avatar">Avatar</label>
          <input class="form-control" placeholder="Avatar" type="file" name="user[avatar]" id="user_avatar" />
        </div>
      HTML

      actual = form_builder.file_field :avatar, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2" for="user_avatar">Avatar</label>
          <div class="col-sm-10">
            <input class="form-control" type="file" name="user[avatar]" id="user_avatar" />
          </div>
        </div>
      HTML

      actual = form_builder.file_field :avatar, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
