# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/select_spec.rb

require "spec_helper"

RSpec.describe RailsBootstrapForm::Inputs::Select do
  let(:address) { ::Address.new(country: ::Country.first) }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:address, address, self, {}) }
  let(:country_options) { options_for_select(::Country.pluck(:name, :id)) }
  let(:country_options_with_selected) { options_for_select(::Country.pluck(:name, :id), form_builder.object.country_id) }

  describe "#select" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <select name="address[country_id]" id="address_country_id">
          #{country_options}
        </select>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Country</label>
          <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="address_country_id">Country</label>
          <select class="form-select" aria-required="true" required="required" placeholder="Country" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="address_country_id">Country</label>
          <div class="col-sm-10">
            <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
              #{blank_option}
              #{country_options}
            </select>
          </div>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "can have a floating label" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-floating">
            <select class="form-select" aria-required="true" required="required" placeholder="Country" name="address[country_id]" id="address_country_id">
              #{blank_option}
              #{country_options}
            </select>
            <label class="form-label required" for="address_country_id">Country</label>
          </div>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {floating: true}

      expect(actual).to match_html(expected)
    end

    it "sets selected option" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="form-floating">
            <select class="form-select" aria-required="true" required="required" placeholder="Country" name="address[country_id]" id="address_country_id">
              #{blank_option}
              #{country_options_with_selected}
            </select>
            <label class="form-label required" for="address_country_id">Country</label>
          </div>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options_with_selected, bootstrap: {floating: true}

      expect(actual).to match_html(expected)
    end

    it "cannot have a floating label in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="address_country_id">Country</label>
          <div class="col-sm-10">
            <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
              #{blank_option}
              #{country_options}
            </select>
          </div>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {floating: true, layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "skips label" do
      expected = <<~HTML
        <div class="mb-3">
          <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {skip_label: true}

      expect(actual).to match_html(expected)
    end

    it "hides label" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label visually-hidden required" for="address_country_id">Country</label>
          <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {hide_label: true}

      expect(actual).to match_html(expected)
    end

    it "adds additional css class" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Country</label>
          <select class="form-select custom-class" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, {}, {class: "custom-class"}

      expect(actual).to match_html(expected)
    end

    it "additional_field_class takes precedance over HTML class" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Country</label>
          <select class="form-select custom-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, {bootstrap: {additional_field_class: "custom-select"}}, {class: "html-class"}

      expect(actual).to match_html(expected)
    end

    it "sets user specified help text" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Country</label>
          <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
          <div class="form-text text-muted">Please select the country</div>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {help_text: "Please select the country"}

      expect(actual).to match_html(expected)
    end

    it "customizes label text" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Region</label>
          <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {label_text: "Region"}

      expect(actual).to match_html(expected)
    end

    it "does not render in a wrapper" do
      expected = <<~HTML
        <label class="form-label required" for="address_country_id">Country</label>
        <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
          #{blank_option}
          #{country_options}
        </select>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {wrapper: false}

      expect(actual).to match_html(expected)
    end

    it "adds additional wrapper options" do
      expected = <<~HTML
        <div class="mb-3" data-controller="test">
          <label class="form-label required" for="address_country_id">Country</label>
          <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {wrapper: {data: {controller: "test"}}}

      expect(actual).to match_html(expected)
    end

    it "appends wrapper[:class] to existing wrapper classes" do
      expected = <<~HTML
        <div class="mb-3 additional-wrapper-class">
          <label class="form-label required" for="address_country_id">Country</label>
          <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {wrapper: {class: "additional-wrapper-class"}}

      expect(actual).to match_html(expected)
    end

    it "sets HTML options" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Country</label>
          <select onchange="this.form.submit();" class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, {bootstrap: {}}, {onchange: "this.form.submit();"}

      expect(actual).to match_html(expected)
    end

    it "supports input group" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Country</label>
          <div class="input-group">
            <span class="input-group-text">
              <strong>$</strong>
            </span>
            <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
              #{blank_option}
              #{country_options}
            </select>
            <span class="input-group-text">0.0</span>
          </div>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {prepend: "<strong>$</strong>", append: "0.0"}

      expect(actual).to match_html(expected)
    end

    it "supports button in input group" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Country</label>
          <div class="input-group">
          <select class="form-select" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
          <button name="button" type="submit" class="btn btn-secondary">Go</button>
          </div>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {append: (button_tag("Go", type: :submit, class: "btn btn-secondary"))}

      expect(actual).to match_html(expected)
    end

    it "supports input group with floating labels" do
      expected = <<~HTML
        <div class="mb-3">
          <div class="input-group">
            <div class="form-floating">
              <select class="form-select" aria-required="true" required="required" placeholder="Country" name="address[country_id]" id="address_country_id">
                #{blank_option}
                #{country_options}
              </select>
              <label class="form-label required" for="address_country_id">Country</label>
            </div>
            <button name="button" type="submit" class="btn btn-secondary">Go</button>
          </div>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {floating: true, append: (button_tag("Go", type: :submit, class: "btn btn-secondary"))}

      expect(actual).to match_html(expected)
    end

    it "changes size of the select field" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="address_country_id">Country</label>
          <select class="form-select form-select-sm" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
          </select>
        </div>
      HTML

      actual = form_builder.select :country_id, country_options, bootstrap: {size: :sm}

      expect(actual).to match_html(expected)
    end

    it "renders errors correctly" do
      address.errors.add(:country_id, :required)

      expected = <<~HTML
        <form role="form" novalidate="novalidate" action="/test" accept-charset="UTF-8" method="post">
          <div class="mb-3">
            <label class="form-label required is-invalid" for="address_country_id">Country</label>
            <select class="form-select is-invalid" aria-required="true" required="required" name="address[country_id]" id="address_country_id">
            #{blank_option}
            #{country_options}
            </select>
            <div class="invalid-feedback">must exist</div>
          </div>
        </form>
      HTML

      actual = bootstrap_form_with(model: address, url: "/test") do |form|
        concat(form.select(:country_id, country_options))
      end

      expect(actual).to match_html(expected)
    end
  end
end
