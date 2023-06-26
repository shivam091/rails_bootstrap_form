# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/collection_select_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::CollectionSelect do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }
  let(:fruit_options) { options_for_select(::Fruit.pluck(:name, :id)) }

  describe "#collection_select" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <select name="user[fruit_id]" id="user_fruit_id">
          #{fruit_options}
        </select>
      HTML

      actual = form_builder.collection_select :fruit_id, ::Fruit.all, :id, :name, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
          <select class="form-select" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
            #{blank_option}
            #{fruit_options}
          </select>
          <div class="form-text text-muted">Select your favorite fruit</div>
        </div>
      HTML

      actual = form_builder.collection_select :fruit_id, ::Fruit.all, :id, :name

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_fruit_id">Favorite fruit</label>
          <select class="form-select" aria-required="true" required="required" placeholder="Favorite fruit" name="user[fruit_id]" id="user_fruit_id">
            #{blank_option}
            #{fruit_options}
          </select>
          <div class="form-text text-muted">Select your favorite fruit</div>
        </div>
      HTML

      actual = form_builder.collection_select :fruit_id, ::Fruit.all, :id, :name, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_fruit_id">Favorite fruit</label>
          <div class="col-sm-10">
            <select class="form-select" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
              #{blank_option}
              #{fruit_options}
            </select>
            <div class="form-text text-muted">Select your favorite fruit</div>
          </div>
        </div>
      HTML

      actual = form_builder.collection_select :fruit_id, ::Fruit.all, :id, :name, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "sets HTML options" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_fruit_id">Favorite fruit</label>
          <select onchange="this.form.submit();" class="form-select" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
            #{blank_option}
            #{fruit_options}
          </select>
          <div class="form-text text-muted">Select your favorite fruit</div>
        </div>
      HTML

      actual = form_builder.collection_select :fruit_id, ::Fruit.all, :id, :name, {}, {onchange: "this.form.submit();"}

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in vertical layout" do
      user.errors.add(:fruit_id, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <label class="form-label required is-invalid" for="user_fruit_id">Favorite fruit</label>
            <select class="form-select is-invalid" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
              #{blank_option}
              #{fruit_options}
            </select>
            <div class="invalid-feedback">can't be blank</div>
            <div class="form-text text-muted">Select your favorite fruit</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test") do |form|
        concat(form.collection_select(:fruit_id, ::Fruit.all, :id, :name))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in inline layout" do
      user.errors.add(:fruit_id, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" class="row row-cols-lg-auto g-3 align-items-center" action="/test" accept-charset="UTF-8" method="post">
          <div class="col-12">
            <label class="form-label visually-hidden required is-invalid" for="user_fruit_id">Favorite fruit</label>
            <select class="form-select is-invalid" aria-required="true" required="required" placeholder="Favorite fruit" name="user[fruit_id]" id="user_fruit_id">
              #{blank_option}
              #{fruit_options}
            </select>
            <div class="invalid-feedback">can't be blank</div>
            <div class="form-text text-muted">Select your favorite fruit</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :inline}) do |form|
        concat(form.collection_select(:fruit_id, ::Fruit.all, :id, :name))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in horizontal layout" do
      user.errors.add(:fruit_id, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="row mb-3">
            <label class="col-form-label col-sm-2 required is-invalid" for="user_fruit_id">Favorite fruit</label>
            <div class="col-sm-10">
              <select class="form-select is-invalid" aria-required="true" required="required" name="user[fruit_id]" id="user_fruit_id">
                #{blank_option}
                #{fruit_options}
              </select>
              <div class="invalid-feedback">can't be blank</div>
              <div class="form-text text-muted">Select your favorite fruit</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :horizontal}) do |form|
        concat(form.collection_select(:fruit_id, ::Fruit.all, :id, :name))
      end

      expect(actual).to match_html(expected)
    end
  end
end
