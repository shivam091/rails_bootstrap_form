# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/color_field_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::ColorField do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#color_field" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input value="#000000" type="color" name="user[favorite_color]" id="user_favorite_color" />
      HTML

      actual = form_builder.color_field :favorite_color, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_favorite_color">Favorite color</label>
          <input class="form-control form-control-color" aria-required="true" required="required" value="#000000" type="color" name="user[favorite_color]" id="user_favorite_color" />
        </div>
      HTML

      actual = form_builder.color_field :favorite_color

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_favorite_color">Favorite color</label>
          <input class="form-control form-control-color" aria-required="true" required="required" placeholder="Favorite color" value="#000000" type="color" name="user[favorite_color]" id="user_favorite_color" />
        </div>
      HTML

      actual = form_builder.color_field :favorite_color, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_favorite_color">Favorite color</label>
          <div class="col-sm-10">
            <input class="form-control form-control-color" aria-required="true" required="required" value="#000000" type="color" name="user[favorite_color]" id="user_favorite_color" />
          </div>
        </div>
      HTML

      actual = form_builder.color_field :favorite_color, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end
  end
end
