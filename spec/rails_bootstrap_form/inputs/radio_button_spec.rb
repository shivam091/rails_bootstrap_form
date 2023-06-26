# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/radio_button_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::RadioButton do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#radio_button" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="radio" value="male" name="user[gender]" id="user_gender_male" />
      HTML

      actual = form_builder.radio_button :gender, "male", bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, "male"

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, "male", bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <div class="col-sm-10 offset-sm-2">
            <div class="form-check">
              <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
              <label class="form-check-label" for="user_gender_male">Gender</label>
            </div>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, "male", bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "does not render in a wrapper" do
      expected = <<~HTML
        <div class="form-check">
          <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
          <label class="form-check-label" for="user_gender_male">Gender</label>
        </div>
      HTML

      actual = form_builder.radio_button :gender, "male", bootstrap: {wrapper: false}

      expect(actual).to match_html(expected)
    end

    it "skips label" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, "male", bootstrap: {skip_label: true}

      expect(actual).to match_html(expected)
    end

    it "hides label" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label visually-hidden" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, "male", bootstrap: {hide_label: true}

      expect(actual).to match_html(expected)
    end

    it "customizes label text" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Male</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, bootstrap: {label_text: "Male"}

      expect(actual).to match_html(expected)
    end

    it "sets user specified help text" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
            <div class="form-text text-muted">Please select your gender</div>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, bootstrap: {help_text: "Please select your gender"}

      expect(actual).to match_html(expected)
    end

    it "sets help text from locale file" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="true" name="user[terms]" id="user_terms_true" />
            <label class="form-check-label" for="user_terms_true">I accept terms and conditions</label>
            <div class="form-text text-muted">You must first accept terms and conditions in order to continue</div>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :terms, true

      expect(actual).to match_html(expected)
    end

    it "adds additional css class using HTML class attribute" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input custom-radio-button" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, class: "custom-radio-button"

      expect(actual).to match_html(expected)
    end

    it "adds additional css class using additional_field_class option" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input custom-radio-button" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, bootstrap: {additional_field_class: "custom-radio-button"}

      expect(actual).to match_html(expected)
    end

    it "additional_field_class takes precedance over HTML class" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input custom-radio-button" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, bootstrap: {additional_field_class: "custom-radio-button"}, class: "html-class"

      expect(actual).to match_html(expected)
    end

    it "adds additional css class to the label" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label custom-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, bootstrap: {additional_label_class: "custom-label"}

      expect(actual).to match_html(expected)
    end

    it "adds additional wrapper options" do
      expected = <<~HTML
        <div class="mb-3" data-controller="hello">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, bootstrap: {wrapper: {data: {controller: "hello"}}}

      expect(actual).to match_html(expected)
    end

    it "appends wrapper[:class] to existing wrapper classes" do
      expected = <<~HTML
        <div class="mb-3 custom-wrapper-class">
          <div class="form-check">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, bootstrap: {wrapper: {class: "custom-wrapper-class"}}

      expect(actual).to match_html(expected)
    end

    it "renders as Bootstrap switches" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-check form-switch">
            <input class="form-check-input" type="radio" value="male" name="user[gender]" id="user_gender_male" />
            <label class="form-check-label" for="user_gender_male">Gender</label>
          </div>
        </div>
      HTML

      actual = form_builder.radio_button :gender, :male, bootstrap: {switch: true}

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in vertical layout" do
      user.errors.add(:gender, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <div class="form-check">
              <input class="form-check-input is-invalid" type="radio" value="male" name="user[gender]" id="user_gender_male" />
              <label class="form-check-label is-invalid" for="user_gender_male">Gender</label>
              <div class="invalid-feedback">can't be blank</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test") do |form|
        concat(form.radio_button(:gender, "male"))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in inline layout" do
      user.errors.add(:gender, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" class="row row-cols-lg-auto g-3 align-items-center" action="/test" accept-charset="UTF-8" method="post">
          <div class="col-12">
            <div class="form-check">
              <input class="form-check-input is-invalid" type="radio" value="male" name="user[gender]" id="user_gender_male" />
              <label class="form-check-label is-invalid" for="user_gender_male">Gender</label>
              <div class="invalid-feedback">can't be blank</div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test", bootstrap: {layout: :inline}) do |form|
        concat(form.radio_button(:gender, "male"))
      end

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly in horizontal layout" do
      user.errors.add(:gender, :blank)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="row mb-3">
            <div class="col-sm-10 offset-sm-2">
              <div class="form-check">
                <input class="form-check-input is-invalid" type="radio" value="male" name="user[gender]" id="user_gender_male" />
                <label class="form-check-label is-invalid" for="user_gender_male">Gender</label>
                <div class="invalid-feedback">can't be blank</div>
              </div>
            </div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: user, url: "/test") do |form|
        concat(form.radio_button(:gender, "male", bootstrap: {layout: :horizontal}))
      end

      expect(actual).to match_html(expected)
    end
  end
end
